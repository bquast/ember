HTMLWidgets.widget({

  name: 'ember',

  type: 'output',

  initialize: function(el, width, height) {

    // create our ember object and bind it to the element
    var emb = new ember(el.id);

    // TODO: add instance fields as required
    return {
      emb: emb
    }

  },

  renderValue: function(el, x, instance) {

    // parse gexf data
    var parser = new DOMParser();
    var data = parser.parseFromString(x.data, "application/xml");

    // apply settings
    for (var name in x.settings)
      instance.sig.settings(name, x.settings[name]);

    // update the sigma instance
    sigma.parsers.gexf(
      data,          // parsed gexf data
      instance.sig,  // sigma instance we created in initialize
      function() {
        // need to call refresh to reflect new settings and data
        instance.sig.refresh();
      }
    );
  },

  resize: function(el, width, height, instance) {

    // forward resize on to sigma renderers
    for (var name in instance.sig.renderers)
      instance.sig.renderers[name].resize(width, height);
  }

});
