<?php

namespace App\Form;

use App\Entity\Participants;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class ParticipantsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ name est requis.',
                    ]),
                ],
            ])
            ->add('lastname', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ lastname est requis.',
                    ]),
                ],
            ])
            ->add('phonenumber', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ phonenumber est requis.',
                    ]),
                ],
            ])
            ->add('id_concours',HiddenType::class)
            ->add('id_user',HiddenType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Participants::class,
        ]);
    }
}
