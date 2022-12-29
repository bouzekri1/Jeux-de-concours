<?php

namespace App\Command;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Formatter\OutputFormatterStyle;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Bridge\Monolog\Logger;
#[AsCommand(
    name: 'create-user')]
class CreateUserCommand extends Command
{
    private UserPasswordHasherInterface $passwordHasher;
    private EntityManagerInterface $em;

    public function __construct(UserPasswordHasherInterface $passwordHasher, EntityManagerInterface $em)
    {
        parent::__construct();

        $this->passwordHasher = $passwordHasher;
        $this->em = $em;
    }

    protected function execute(InputInterface $input, OutputInterface $output):int
    {
        $email = $input->getArgument('email');
        $password = $input->getArgument('password');
        $output->setDecorated(true);

        if(!is_null($this->em->getRepository(User::class)->findOneBy(['email' => $email])))
        {
            $errorOutputStyle = new OutputFormatterStyle('red');
            $output->getFormatter()->setStyle('error', $errorOutputStyle);
            $output->writeln('<error>email already exists</>');
            return Command::FAILURE;
        }

        $newUser = new User();
        $newUser->setEmail($email);
        $newUser->setPassword(
            $this->passwordHasher->hashPassword($newUser, $password)
        );

        $this->em->persist($newUser);
        $this->em->flush();

        $successOutputStyle = new OutputFormatterStyle('green');
        $output->getFormatter()->setStyle('success', $successOutputStyle);
        $output->writeln('<success>User is added successfully</>');

        return Command::SUCCESS;
    }

    protected function configure()
    {
        $this->addArgument('email', InputArgument::REQUIRED, 'email (no spaces)');
        $this->addArgument('password', InputArgument::REQUIRED, 'plain password of the user');
    }

}