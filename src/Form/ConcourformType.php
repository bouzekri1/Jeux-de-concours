<?php

namespace App\Form;

use App\Entity\Concours;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class ConcourformType extends AbstractType
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
            ->add('description', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ description est requis.',
                    ]),
                ],
            ])
            ->add('rewords', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ rewards est requis.',
                    ]),
                ],
            ])
            ->add('valeur', TextType::class, [
                'constraints' => [
                    new Assert\NotBlank([
                        'message' => 'Le champ valeur est requis.',
                    ]),
                ],
            ])

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Concours::class,
        ]);
    }
}
