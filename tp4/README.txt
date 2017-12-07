Membres:
Quentin Robert
NGUYEN Duc Hau NGUD03039508

==== Requisited:
- Vous devez avoir Nodejs (npm) et installer sailsjs (npm install -g sails)

==== Getting started:
- Mettez vous sur le même répertoire que "app.js".
- Lancez (installation dépendances) >> npm install
- Lancez >> sails lift

Par défault notre serveur est à l'écoute sur le port 1337. Vous pouvez lancer le serveur sur d'autre port avec le paramètre "--port"
>> sails lift -- port <Votre port>

Pour le mode de production:
>> node app.js --prod

Documentation: https://sailsjs.com/documentation/reference/command-line-interface/sails-lift

Notre application connecte au port 27017 (par défault de sails). Si votre mongo écoute sur d'autre port, modifier le variable "port" dans connections.js
// Dans config/connection.js
module.exports.connections = {
    ...
    customMongoDb: {
        ...
        port: 27017, // <--- Modifier
        ...
    }
    ...
}

==== Test avec Postman

1. Convention d'API Rest
Les méthodes et routes sera mappé aux fonctions demandés comme la suite:

"GET api/disks" 	==> getDisks():		Retourner un array contenant tous les albums dans réponse.
"GET api/disk/:id" 	==> getDisk(id):	Retourener l'album corresondant à l'id dans paramètre dans réponse.
"PUT api/disk"		==> addDisk():		Créer un nouvel album grâce aux valeurs dans request body, répond par un code HTTP/200.
"DELETE api/disk/:id"	==> deleteDisk(id):	Supprimmer le disk correspondant l'id dans paramètre, réponse par un code HTTP/200 avec le contenu d'album dans body.
"POST api/disk/:id"	==> editDisk(id):	Modifier les valeurs correspondant aux clés présentées dans le body request, réponse par un code HTTP/200 avec le contenu mise à jour.

Dans tous les cas, si une erreur imprévu survient, vous recevez une réponse HTTP/500 avec l'erreur dans body.

2. Convention dans le model (collection):
Notre model (Album) a une valeur par défault pour le champs *released* la date du moment de création. Tous les autres sont vide si aucune information nécessaire renseignée.

3. Test ajouter un nouvel album avec un contenu vide:
Nous recevons une réponse 200 avec un objet de Album qui contient *released* (et aussi *id*, *createAt* et *updatedAt*)
Comme indiqué dans la partie précédente, un nouvel objet sera créé même si aucune information renseigné avec une seul attribut *released* contient la valeur par défault.

4. Test des opérations getDisk(id), deleteDisk(id) et editDisk(id) avec id non présent dans la base de données.
L'application enverra tout simplement une réponse HTTP/404

5. Les tests de fonctionnemnts
Ceci est un test examplaire parce qu'on n'a pas beaucoup de temps de tester un grande échelle

* addDisk:

Dans POSTMAN:
"PUT api/disk"
{title: 'album title', artists: 'Michael', artists: 'Johnny', style: 'rock'}

Reponse: 
HTTP/200
{

    "title": "album title",

    "artists": [

        "Johnny",

        "Michael"

    ],

    "released": "2017-07-12T04:00:00.000Z",

    "style": "rock",

    "createdAt": "2017-12-07T16:57:15.137Z",

    "updatedAt": "2017-12-07T16:57:15.137Z",

    "id": "5a2972eb8e53885c6ab43536"

}

/// Un nouveau document dans Mongodb

* editDisk:
Dans POSTMAN:
"POST api/disk/5a2972eb8e53885c6ab43536"
{artists: 'Unknown', title: 'New title'}

Reponse: 
HTTP/200
[{

    "title": "New title",

    "artists": [

        "Unknown"
    ],

    "released": "2017-07-12T04:00:00.000Z",

    "style": "rock",

    "createdAt": "2017-12-07T16:57:15.137Z",

    "updatedAt": "2017-12-07 17:01:09.166Z",

    "id": "5a2972eb8e53885c6ab43536"

}]

/// Le document a été modifié dans mongodb

* getDisk:
Dans POSTMAN:
"GET api/disk/5a2972eb8e53885c6ab43536"

Response:
HTTP/200
{

    "title": "New title",

    "artists": [

        "'Unknown'"

    ],

    "released": "2017-07-12T04:00:00.000Z",

    "style": "rock",

    "createdAt": "2017-12-07T16:57:15.137Z",

    "updatedAt": "2017-12-07T17:01:09.166Z",

    "id": "5a2972eb8e53885c6ab43536"

}

Dans POSTMAN:
"GET api/disks"

Response:
HTTP/200
[

    {

        "title": "New title",

        "artists": [

            "'Unknown'"

        ],

        "released": "2017-07-12T04:00:00.000Z",

        "style": "rock",

        "createdAt": "2017-12-07T16:57:15.137Z",

        "updatedAt": "2017-12-07T17:01:09.166Z",

        "id": "5a2972eb8e53885c6ab43536"

    }

]

* deleteDisk:

Dans POSTMAN:
"DELETE api/disk/5a2972eb8e53885c6ab43536"

Response:
HTTP/200
[

    {

        "title": "New title",

        "artists": [

            "'Unknown'"

        ],

        "released": "2017-07-12T04:00:00.000Z",

        "style": "rock",

        "createdAt": "2017-12-07T16:57:15.137Z",

        "updatedAt": "2017-12-07T17:01:09.166Z",

        "id": "5a2972eb8e53885c6ab43536"

    }

]

/// Maintenant on n'a plus ce document dans Mongodb.