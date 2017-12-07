/**
 * DiskController
 *
 * @description :: Server-side logic for managing disks
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	getAll: function(req, res) {
	  Album.find().exec(function (err, disks){
	    if(err) {
	      return res.json(500, err);
      }
      
      return res.json(200, disks);
    });
  },
  
  get: function(req, res) {
	  Album.findOne({id: req.param('id')}).exec(function(err, disk) {
	    if(err) {
	      return res.json(500, err);
      }
      
      if(!disk)
        return res.json(404);
      
      return res.json(200, disk);
    })
  },
  
  add: function(req, res) {
	  Album.create(req.body).exec(function(err, disk) {
	    if(err)
	      return res.json(500, err);
      
	    return res.json(200, disk);
    })
  },
  
  edit: function(req, res) {
	  Album.update({id: req.param('id')}, req.body).exec(function(err, updated) {
      if(err)
        return res.json(500, err);
    
      if(!updated)
        return res.json(404);
      
      return res.json(200, updated);
    })
  },
  
  remove: function(req, res) {
	  Album.destroy({id: req.param('id')}).exec(function(err, disk) {
      if(err)
        return res.json(500, err);
    
      if(!disk)
        return res.json(404);
      
      return res.json(200, disk);
    })
  }
};

