<?php

namespace App\Controller;

use App\Entity\Concours;
use App\Entity\User;
use App\Entity\Participants;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    private EntityManagerInterface $entityManager;
    public function __construct(EntityManagerInterface $entityManager){
    $this->entityManager = $entityManager;
    }
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

    #[Route('/api/users', name: 'app_joueurs')]
    public function getUsers(){
    // Vérifiez que l'utilisateur est un administrateur
    $this->denyAccessUnlessGranted('ROLE_ADMIN');

    // Extrayez les données des utilisateurs à partir de la base de données
    $joueurs = $this->entityManager->getRepository(Participants::class)->findAll();

    // Créez un tableau contenant les données à renvoyer en format JSON
    $data = [];
    foreach ($joueurs as $Participants) {
        $data[] = [
            'id' => $Participants->getId(),
            'name' => $Participants->getName(),
            'last name' => $Participants->getLastname(),
            'phone number' => $Participants->getPhonenumber(),
            'id du concours' => $Participants->getIdConcours(),
            'est gagnant' => $Participants->getIsGagnant(),


        ];
    }

    // Renvoyez les données en format JSON
    return new JsonResponse($data);
}
}
