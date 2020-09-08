# VHDL
Calculatrice GCD

Le but de ce projet est d'implémenter une machine à états finis en VHDL pour calculer le
Le plus grand diviseur commun (GCD) de 2 nombres. L'algorithme utilisé pour calculer le GCD est comme suit.
Deux nombres sont comparés (x = y). Si tel est le cas, le GCD est trouvé. Si x> y, alors 
x = x - y. Les deux nombres sont ensuite comparés à nouveau. Si y> x, alors y = y - x. Les deux nombres sont comparés une fois de plus. Voici un exemple de notre algorithme: schema est bien claire dans le dossier de l'execution

La conception de la calculatrice GCD doit être divisée en 2 parties : un contrôleur et un chemin de données.
Le contrôleur est un FSM qui envoie des commandes au chemin de données en fonction de l'état actuel et les entrées externes. Cela peut être une description comportementale. Le chemin de données contient une liste nette des unités fonctionnelles ou des modules comme des multiplexeurs, des registres, des soustracteurs et un comparateur, et donc
cette conception est structurelle. Le contrôleur parcourt essentiellement l'algorithme GCD montré ci-dessus.  Si x = y, nous avons fini de calculer le GCD, et nous passons à l'état final et affirmons les données de  sortie. 
Le chemin de données effectue le calcul GCD réel. Il comprend les éléments suivants:
• Mux: prend 2 entrées 4 bits et une ligne de sélection. Basé sur la ligne de sélection, il sort soit le premier nombre de 4 bits ou le 2e nombre de 4 bits.
• Registre: prend une entrée 4 bits, un signal de charge, une réinitialisation et un signal d'horloge. Si le signal de charge est haut et l'horloge est pulsée, il émet le nombre de 4 bits.
• Comparateur: prend 2 nombres de 4 bits et active l'un des 3 signaux selon
si le premier nombre est inférieur, supérieur ou égal au deuxième nombre.
• Soustracteur: prend 2 nombres de 4 bits, soustrait le plus petit nombre du plus grand.
• Registre de sortie: contient la valeur GCD. Lorsque x = y le GCD a été trouvé et peut être
sortie. Comme il s'agit d'une entité de registre, elle doit également prendre une horloge et réinitialiser le signal.

Vous trouverez dans le dossier le schéma fonctionnel qui montre l'interconnexion entre la commande et l'unité de chemin de données.  L’unité Datapath se compose de plusieurs modules tels que le multiplexeur, le comparateur, etc. qui sont écrits dans une structure technique. 
Chacun des modules est compilé et simulé individuellement et enregistré dans un fichier différent.
Le fichier d'unité de Datapath est créé à l'aide du module ou du composant créé avec lequel sont interconnectés en utilisant l'instruction portmap. Jusqu'à cette étape, l'unité Datapath est prête à la  simulation pour vérifier sa fonctionnalité et doit être enregistré dans le même dossier avec ses composants. 
Donc on a  un nouveau fichier qui est la calculatrice GCD qui intègre l’ Unité Datapath  et unité de contrôle en utilisant l'instruction portmap.
 
