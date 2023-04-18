<?php

namespace App\Controller;


use App\Entity\Concours;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ListeConcoursController extends AbstractController
{
    #[Route('/liste_concours', name: 'app_liste_concours')]
    public function index(EntityManagerInterface $em): Response
    {
        $repository = $em->getRepository(Concours::class);
        /** @var Concours $concours */
        $concours = $repository->findBy(['isActive'=>true]);
        return $this->render('liste_concours/index.html.twig', [
            'controller_name' => 'ListeConcoursController', 'concours'=>$concours
        ]);
    }
}
