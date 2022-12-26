<?php

namespace App\Controller;

use App\Form\ConcourformType;
use App\Entity\Concours;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class ConcoursController extends AbstractController
{
    #[Route('/concours', name: 'app_concours')]

    //To delete 
    public function index(Environment $twig,Request $request,  EntityManagerInterface $entityManager): Response
    {

       
        $concour = new Concours();
        $form = $this->createForm(ConcourformType::class, $concour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $concour->setIsActive(true);
            $entityManager->persist($concour);
            $entityManager->flush();
        }
        return new Response($twig->render('concours/index.html.twig',['concour_form'=> $form->createView()]));

        // return $this->render('concours/index.html.twig', [
        //     'controller_name' => 'ConcoursController',
        // ]);
    }

    
    // #[Route('/addconcours', name: 'app_add_concours',methods:["POST"])]
    // public function addConcours(Request $request , EntityManagerInterface $entityManager): Response
    // {   
    //     $concour = new Concours();
    //     $form = $this->createForm(ConcourformType::class, $concour);
    //     $form->handleRequest($request);

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         // encode the plain password
    //         $entityManager->persist($concour);
    //         $entityManager->flush();
    //     }

    //     $dd = 0;
    //     // $dd = $request->get("users");

    //     return $this->render('concours/index.html.twig', [
    //         'concourForm' => $form->createView(),
    //     ]);
    // }
}
