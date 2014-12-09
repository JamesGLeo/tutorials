 
// Monkeying with a built-in type (BAD!!!)
Array.prototype.sample = function(){
  var idx = Math.floor(Math.random() * this.length );
  return this[idx];
};


function randomCirclesData(numCircles){
  var circles = [];
  for (var i = 0; i < numCircles; i++) {
    circles.push (
      {
        r: (Math.random()*5+2) + '%',
        cx: (Math.random()*100) + '%',
        cy: (Math.random()*100) + '%',
        fill: crayola.sample().hex,
        opacity: Math.random()
      }
    );
  }

  return circles;
}


function explode(bubble){
  bubble
  .transition()
    .duration(500)
      .attr('r', '100%');
  return this;
}


function projectData(data){

// PRE-PROJECTION
  var projection = d3.select('svg')       // Select the SVG tag
                     .selectAll('circle') // Select any existing 'circle' elements
                     .data(data);         // Get the data of those elements

      projection.enter()                      // Takes data that exists but isn't on the DOM
                .append('circle')             // Append them to circle elements
                .style('opacity', 0)          // Set the opacity
                .style('fill', function (dataElement) { return dataElement.fill; })
                .on('mousedown', function(){  // blow up whatever circle you click on
                  explode(d3.select(this));
                });

// PROJECTION ACTIONS
      projection = d3.select('svg')       // Select the SVG tag
                     .selectAll('circle') // Select any existing 'circle' elements
                     .data(data);         // Get the data of those elements

      projection.transition()             // Make the circles do cool things
                .duration(1000)
                .attr('r', function(dataElement){ return dataElement.r; })
                .attr('cx', function(dataElement){ return dataElement.cx; })
                .attr('cy', function(dataElement){ return dataElement.cy; })
                .style('fill', function(dataElement){ return dataElement.fill; })
                .style('opacity', function(dataElement){ return dataElement.opacity; });

// PROJECTION REMOVAL ACTIONS
      projection = d3.exit()              // Takes DOM objects that exists but aren't in the DB
                     .remove();           // Remove those elements
}


window.onload=function(){

  d3.select("svg")
    .attr("width", '100%')
    .attr("height", '75%')
    .style("border", "1px solid black");

  setInterval(function(){
    var numCircles = 57;
    projectData(randomCirclesData(numCircles));
  }, 900);

};
