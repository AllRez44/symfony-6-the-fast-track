<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ConferenceController extends AbstractController
{
    #[Route('/', name: 'homepage')]
    public function index(Request $request): Response
    {
        $name = ucfirst(htmlspecialchars($request->query->get('hello','')));
        return $this->render('/index.html.twig', [
            'name' => $name,
            'controller_name' => 'ConferenceController',
        ]);
    }
}
