<?php

namespace App\Controller;

use App\Entity\Concours;
use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class ResultatController extends AbstractController
{
    #[Route('/resultat', name: 'app_resultat')]
    public function index(Environment $twig,Request $request,  EntityManagerInterface $entityManager): Response
    {

        $id_user = $_GET['id_user'];
        $repository = $entityManager->getRepository(Participants::class);
        $concours = $repository->findBy(['id_user'=>$id_user, 'isGagnant'=>true]);

        $concoursParticiper = [];
        foreach($concours as $concour){
            $repository = $entityManager->getRepository(Concours::class);
            $concours = $repository->findOneBy(['id'=>$concour->getIdConcours()]);
            array_push($concoursParticiper, $concours);
        }
        // dd($concoursParticiper);
        return $this->render('resultat/index.html.twig', [
            'controller_name' => 'ResultatController', 'concoursParticiper'=>$concoursParticiper
        ]);
    }
}
