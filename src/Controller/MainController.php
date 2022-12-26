<?php

namespace App\Controller;

use App\Entity\Concours;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    #[Route('/main', name: 'app_main')]
    public function index(EntityManagerInterface $em): Response
    {

        $repository = $em->getRepository(Concours::class);
        /** @var Concours $concours */
        $concours = $repository->findBy(['isActive'=>true]);
        return $this->render('main/index.html.twig', [
            'controller_name' => 'MainController', 'concours'=>$concours
        ]);
    }
}
