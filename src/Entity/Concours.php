<?php

namespace App\Entity;

use App\Repository\ConcoursRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConcoursRepository::class)]
class Concours
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(nullable: true)]
    private ?string $rewords = null;

    #[ORM\Column(nullable: true)]
    private ?float $valeur = null;

    #[ORM\Column(nullable: false)]
    private ?bool $isActive = null;

      public function getIsActive(): ?bool
    {
        return $this->isActive;
    }
      public function setIsActive(bool $isActive): self
    {
        $this->isActive = $isActive;
        return $this;
    }
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getRewords(): ?string
    {
        return $this->rewords;
    }

    public function setRewords(?string $rewords): self
    {
        $this->rewords = $rewords;

        return $this;
    }

    public function getValeur(): ?float
    {
        return $this->valeur;
    }

    public function setValeur(?float $valeur): self
    {
        $this->valeur = $valeur;

        return $this;
    }
}
