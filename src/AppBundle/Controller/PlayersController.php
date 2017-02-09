<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Joueur;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Description of playersController
 * 
 * @author ff
 */
class PlayersController extends Controller {

    /**
     * Methode qui va ajouter les joueurs en base de données
     * A la fin du traitement on est rediriger sur le controlleur
     * afin de retourner la vue de creation de personnage
     * 
     * Si le joueur existe en BD on le mets en session,
     * sinon on l'enregistre et on le mets en session
     * @Route("/players/add", name="addPlayers")
     * @Method({"POST"})
     * @param \Request $r
     */
    public function addPlayers(Request $r) {
        $em = $this->getDoctrine()->getManager();

        //boucle sur valeurs de 1 à 4
        for ($i = 1; $i <= 4; $i++) {
            // stockage de la valeur dans la variable email
            $email = $r->get('j' . strval($i));
            //on va chercher l'email du user dans la DB
            $checkEmail = $em->getRepository(Joueur::class)->findByEmail($email);

            if ($email != null) {

                //si joueur existant
                if ($checkEmail) {
                    
                    // on recupere la session correspondant a l'email
                    $r->getSession()->set('j' . strval($i), $checkEmail);
                    // on reroute sur la homepage
                    return $this->redirectToRoute("createPerso");
//                    return new Response($email." possede deja un compte");
                } else {
                    // si nouveau joueur

                    $joueur = new Joueur();
                    $joueur->setEmail($email);
                    $em->persist($joueur);
                    // mise en session du joueur
                    $r->getSession()->set('j' . strval($i), $joueur);
                    return $this->redirectToRoute("createPerso");
                }
            }
        }
        $em->flush();


//       //m'a permis de verifier les valeurs du formulaire
//       return new Response($r->get('j1'));
    }

}
