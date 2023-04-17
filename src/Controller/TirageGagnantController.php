<?php

namespace App\Controller;

use App\Entity\Concours;
use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TirageGagnantController extends AbstractController
{
    #[Route('/tirage/gagnant', name: 'app_tirage_gagnant')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {
        $id_concr = $_GET['id_concr'];
        
        $repository = $entityManager->getRepository(Participants::class);
        $particippant= $repository->findBy(['id_concours' => $id_concr]);
        shuffle($particippant);
        // dd($particippant);
        
        return $this->render('tirage_gagnant/index.html.twig', [
            'controller_name' => 'TirageGagnantController', 'participants'=>$particippant,'id_concr'=>$id_concr,'errorMessage' => null
        ]);
    }

     #[Route('/tirage/result', name: 'app_tirage_result')]
    public function result(Request $request, EntityManagerInterface $entityManager): Response
    {
        $nb_gagnant = $_POST['nb_gagnant'];
        $id_concr = $_POST['id_concr'];
        $repository = $entityManager->getRepository(Participants::class);
        $particippant= $repository->findBy(['id_concours' => $id_concr]);

       
        if($nb_gagnant>count($particippant))
        {
            return $this->render('tirage_gagnant/index.html.twig', [
                'id_concr'=>$id_concr,
                'participants'=>$particippant,
            'errorMessage' => 'le nombre des gagnants est superieur aux participants'
        ]);
        }

        // traitement
         shuffle($particippant);

        $participants_gagnants = array();
        for ($i = 0; $i < $nb_gagnant;$i++)
        {
            array_push($participants_gagnants, $particippant[$i]);
            $particippant[$i]->setIsGagnant(true);
            $entityManager->persist($particippant[$i]);
            $entityManager->flush();
            
        }

        $repository  = $entityManager->getRepository(Concours::class);
        $concour=  $repository->findBy(['id' => $id_concr]);
        foreach($concour as $conc)
        {
            $conc->setIsActive(false);
            $entityManager->persist($conc);
            $entityManager->flush();

        }
        
        
        
        return $this->render('tirage_gagnant/gagnants.html.twig', [
        'participants'=>$participants_gagnants
        ]);
    }




}
