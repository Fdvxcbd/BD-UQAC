Membres:
Quentin Robert
NGUYEN Duc Hau NGUD03039508

==== Requisited:
- Vous devez avoir Nodejs (npm) et installer sailsjs (npm install -g sails)

==== Getting started:
- Mettez vous sur le m�me r�pertoire que "app.js".
- Lancez (installation d�pendances) >> npm install
- Lancez >> sails lift

Par d�fault notre serveur est � l'�coute sur le port 1337. Vous pouvez lancer le serveur sur d'autre port avec le param�tre "--port"
>> sails lift -- port <Votre port>

Pour le mode de production:
>> node app.js --prod

Documentation: https://sailsjs.com/documentation/reference/command-line-interface/sails-lift

Notre application connecte au port 27017 (par d�fault de sails). Si votre mongo �coute sur d'autre port, modifier le variable "port" dans connections.js
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
Les m�thodes et routes sera mapp� aux fonctions demand�s comme la suite:

"GET api/disks" 	==> getDisks():		Retourner un array contenant tous les albums dans r�ponse.
"GET api/disk/:id" 	==> getDisk(id):	Retourener l'album corresondant � l'id dans param�tre dans r�ponse.
"PUT api/disk"		==> addDisk():		Cr�er un nouvel album gr�ce aux valeurs dans request body, r�pond par un code HTTP/200.
"DELETE api/disk/:id"	==> deleteDisk(id):	Supprimmer le disk correspondant l'id dans param�tre, r�ponse par un code HTTP/200 avec le contenu d'album dans body.
"POST api/disk/:id"	==> editDisk(id):	Modifier les valeurs correspondant aux cl�s pr�sent�es dans le body request, r�ponse par un code HTTP/200 avec le contenu mise � jour.

Dans tous les cas, si une erreur impr�vu survient, vous recevez une r�ponse HTTP/500 avec l'erreur dans body.

2. Convention dans le model (collection):
Notre model (Album) a une valeur par d�fault pour le champs *released* la date du moment de cr�ation. Tous les autres sont vide si aucune information n�cessaire renseign�e.

3. Test ajouter un nouvel album avec un contenu vide:
Nous recevons une r�ponse 200 avec un objet de Album qui contient *released* (et aussi *id*, *createAt* et *updatedAt*)
Comme indiqu� dans la partie pr�c�dente, un nouvel objet sera cr�� m�me si aucune information renseign� avec une seul attribut *released* contient la valeur par d�fault.

4. Test des op�rations getDisk(id), deleteDisk(id) et editDisk(id) avec id non pr�sent dans la base de donn�es.
L'application enverra tout simplement une r�ponse HTTP/404

5. Les tests de fonctionnemnts
Ceci est un test examplaire parce qu'on n'a pas beaucoup de temps de tester un grande �chelle

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

/// Le document a �t� modifi� dans mongodb

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