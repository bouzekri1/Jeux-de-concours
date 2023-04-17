<?php

namespace App\Controller;

use App\Entity\Concours;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AnciensConcoursController extends AbstractController
{
    #[Route('/anciens/concours', name: 'app_anciens_concours')]
 
     public function index(EntityManagerInterface $em): Response
    {

        $repository = $em->getRepository(Concours::class);
        /** @var Concours $concours */
        $concours = $repository->findBy(['isActive'=>false]);

        return $this->render('anciens_concours/index.html.twig', [
            'controller_name' => 'AnciensConcoursController','concours'=>$concours
        ]);
    
    }
}
