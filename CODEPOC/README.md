# Deep Reinforcement Learning pour la planification d’itinéraire (SUMO / Bari)

**Auteur :** HIRECHE Zoulikha  
**Référence principale :** Paparella et al., *A Deep Reinforcement Learning Approach for Route Planning of Autonomous Vehicles* (2024)  
**Simulation :** SUMO + TraCI    
**Données :** réseau urbain de Bari (`bari.net.xml`, `bari.sumocfg`)

---

## Objectif
Reproduire, sous forme de PoC et avec un budget d’entraînement limité, l’idée centrale de l’article :  
comparer une approche **globale** (un agent unique sur tout le réseau) à une approche **modulaire** (agents spécialisés par zone + mécanisme de sélection “manager”).

---

## Structure du dépôt
- `poc_bari_sumo_rl.ipynb` : notebook principal (code + exécution complète des expériences)
- `REPORT.md` : rapport suivant le plan demandé 
- `data/` : fichiers SUMO  
  - `bari.net.xml`  
  - `bari.sumocfg`
- `outputs/` : artefacts générés (figures + tables)
  - `global_50k.png`
  - `fig5_like_modular_50k.png`
  - `fig7_like_table_examples.csv`

---

## Reproductibilité (procédure d’exécution)
1. Installer **SUMO** et vérifier l’accès à TraCI.
2. Ouvrir `poc_bari_sumo_rl.ipynb`.
3. Dans la **Cellule 1**, ajuster si nécessaire :
   - `SUMO_HOME`
   - `PROJECT`
4. Exécuter les cellules dans l’ordre (1 → 9).  
Les figures et tables sont automatiquement sauvegardées dans `outputs/`.

---

## Expériences réalisées (résumé)
- **Agent global** : entraînement PPO sur toutes les arêtes `passenger` du réseau.
- **Approche modulaire** : partition du réseau en 4 zones (quadrants) et entraînement de **4 agents** (un par zone).
- **Manager** : pour chaque épisode, exécute les 4 agents zonés et retient la meilleure trajectoire (meilleur retour) — approximation de la logique de sélection décrite dans l’article.

Les résultats détaillés sont présentés dans `REPORT.md`.

---

## Hypothèses / écarts par rapport à l’article (PoC)
- **Priority edges** : absence de marquage “voies AV” dans Bari → approximation par les **10% d’arêtes les plus rapides**.
- **Action space** : utilisation de `rerouteTraveltime()` (SUMO) → différent de l’action “gauche/droite/tout droit” aux intersections.
- **Budget d’entraînement** : limité (50k timesteps) → inférieur à l’entraînement du papier.
- **Manager** : sélection “best return” sur des sous-réseaux zonés → à interpréter comme une approximation.

---

## Références
- Paparella et al., 2024 — *A Deep Reinforcement Learning Approach for Route Planning of Autonomous Vehicles*.
- Documentation SUMO / TraCI.
- OpenStreetMap (Bari).
