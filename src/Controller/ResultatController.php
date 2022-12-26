<?php

namespace App\Controller;

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
        return $this->render('resultat/index.html.twig', [
            'controller_name' => 'ResultatController', 'concours'=>$concours
        ]);
    }
}
