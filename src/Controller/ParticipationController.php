<?php

namespace App\Controller;
use App\Form\ParticipantsType;
use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;

class ParticipationController extends AbstractController
{
    #[Route('/participation', name: 'app_participation')]
    public function index(Environment $twig,Request $request,  EntityManagerInterface $entityManager): Response
    {
        $id_concr = $_GET['id_concr'];
        $id_user = $_GET['id_user'];
       

        $existingParticipant = $entityManager->getRepository(Participants::class)->findOneBy(['id_user' => $id_user, 'id_concours'=>$id_concr]);

    // If an existing participant is found
        if ($existingParticipant) {
        // Handle the case where the user is already a participant
                $this->addFlash('error', 'Acces refusé car vous avez déjà participé au concour.');
                return $this->redirectToRoute('app_main');
        }

        $participants = new Participants();
        $form = $this->createForm(ParticipantsType::class, $participants);
        $form->handleRequest($request);
       

       

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $entityManager->persist($participants);
            $entityManager->flush();
        }
        return new Response($twig->render('participation/index.html.twig',['participation_form'=> $form->createView(),'id_user'=>$id_user,'id_concr'=>$id_concr,]));

        // return $this->render('concours/index.html.twig', [
        //     'controller_name' => 'ConcoursController',
        // ]);
        
    }
    
}
