<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Description of playersController
 * 
 * @author ff
 */
class PlayersController extends Controller{

    /**
     * Methode qui va ajouter les joueurs en base de données
     * A la fin du traitement on est rediriger sur le controlleur
     * afin de retourner la vue de creation de personnage
     * 
     * @Route("/players/add", name="addPlayers")
     * @param \Request $r
     */
    public function addPlayers(Request $r) {
        return $this->redirectToRoute("createPerso");
//         //m'a permis de verifier les valeurs du formulaire
//       return new Response($r->get('j1'));
    }
    
    
}