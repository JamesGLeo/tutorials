```js

function randomColor() {
  var color_string = 'rgba(';
  color_string += Math.floor(Math.random()*255) + ', ';
  color_string += Math.floor(Math.random()*255) + ', ';
  color_string += Math.floor(Math.random()*255);
  color_string += ', 1.0)';
  return color_string;
}

function changeBackground(){
  body.style.backgroundColor = randomColor();
}
var body = document.body;
setInterval(changeBackground, 10);

function randomFontSize(){
  return Math.floor(Math.random()*50) + "px"
}

var articles = document.getElementsByTagName('article');

function messWithArticles(){
  for (var i = 0; i < articles.length; i++){
    articles[i].style.color= randomColor();
  }
}

setInterval(messWithArticles, 10)



var pics = document.getElementsByTagName('img');
for (var i = 0; i < pics.length; i++){
  pics[i].src = "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/1888/thumb_Screen_Shot_2014-06-02_at_4.04.03_PM.png"
}




```


# The DOM (Document Object Model)
####LEARNING OBJECTIVES
- Create a DOM tree from a given section of HTML
- Describe the difference between ELEMENT NODE AND TEXT NODE
- Change the backgroundColor property of document.body


The DOM represents an HTML document as a tree.  A tree is constituted of parent-child relationships.

```html
<html>
  <head>
    <title>WDI, meet DOM</title>
  </head>
  <body>
    <ul>
      <li> Aldric </li>
      <li> Andrew </li>
      <li> Matt </li>
    </ul>
  </body>
</html>
```

The DOM tree for this HTML would look something like this:
![](dom_intro.png)

Key Notions:
- HTML tags are ***element nodes***.  Pieces of text are ***text nodes***
- Every piece of the DOM is an object.  We can retrieve a node and manipulate it's properties.

## ***EXERCISE***: BREAK OUT INTO GROUPS AND CREATE A DOM TREE FOR SOME HTML.  It most contain a ul with at least three elements.
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Week Daze</title>
</head>
<body>
  <h1>Week Daze</h1>
  <ul>
    <li>Manic Monday</li>
    <li>Tragic Tuesday</li>
    <li>Weary Wednesday</li>
    <li>Thanatopsis Thursday</li>
    <li>Fragile Friday</li>
  </ul>
</body>
</html>

```


# NODE TYPES
There are 12 node types.  We only care about ELEMENT_NODE(3) and TEXT_NODE(1)


```html
<script type="text/javascript" charset="utf-8">
function filterByNodeType(num){
  var childNodes = document.body.childNodes;
  for (var i = 0; i < childNodes.length; i++) {
      if (childNodes[i].nodeType == num){
        console.log(childNodes[i]);
      }
  }
}

  }
</script>
```

tagName and nodeName


```html
<script type="text/javascript" charset="utf-8">
function printChildNodeNames(parentNode){
    var childNodes = parentNode.childNodes;
    for (var i = 0; i < childNodes.length; i++){
      console.log(childNodes[i].nodeName);
    }
}

</script>
```

Possible exercises:
- write the same function but for tagName
- use the existing function to print out the nodeNames for the children of the ul.



# CHANGING NODE PROPERTIES

```js
document.body.style.backgroundColor = 'chartreuse';
document.body.style.fontFamily = 'Helvetica-Neue';
```

## ***EXERCISE***: In the browser, change your background color to 'pink' and your font to 'Courier-new'



# Accessing nodes
####Learning objectives
- Explain difference between document.body and document.documentElement
- Explain the difference between node.childNodes and node.children
- Traverse the DOM using:
  - firstChild, lastChild, firstElementChild, lastElementChild
  - previousSibling, nextSibling, previousElementSibling, nextElementSibling

##childNodes vs. children
```html
<script type="text/javascript" charset="utf-8">
  function showChildNodes() {
    var childNodes = document.body.childNodes;
    for (var i = 0; i < childNodes.length; i++) {
      console.log(childNodes[i]);
    }
  }
  function showChildren(){
    var children = document.body.children;
    for (var i = 0; i < children.length; i++) {
      console.log(children[i]);
    }
  }
</script>
<button onclick="showChildNodes()">Show child Nodes</button>
<button onclick="showChildren()">Show children</button>
```

firstChild, lastChild, firstElementChild, lastElementChild

previousSibling, nextSibling, previousElementSibling, nextElementSibling

potential exercises:
- Grab the last element of your ul  only previousSibling and lastChild
- Grab the second element of your ul using only nextSibling and firstChild
- Grab the first element of your ul using previousElementSibling and lastElementChild
- Grab the second elent of your ul using only nextElementSibling and firstElementChild



# innerHTML, aka, the illness.
- Modify an element Node using innerHTML.
- Append text to an existing node


```js
document.body.innerHTML = "ANDREW SMELLS";
```

```js
document.body.firstElementChild.innerHTML="<li>alric the great</li><li>Andrew the great</li>"
```

Possible exercises:
- Write a method that takes a ul node as an argument. it should append '..the great' to each of it's lis.


```js
function appendTheGreat(ulNode){
  var childElementNodes = ulNode.children
  for (var i = 0; i < childElementNodes.length; i++){
    childElementNodes[i].innerHTML += "...the great";
  }
}
```

- Write a method that replaces all lis with blue circles

```js


function blueCircleBomb(ulNode){
  var childElementNodes = ulNode.children
  for (var i = 0; i < childElementNodes.length; i++){
    childElementNodes[i].innerHTML = "<div style='background-color: blue; height: 10px; width: 10px; border-radius: 5px;'></div>"
    // childElementNodes[i].setAttribute("class", "square");
    // console.log("after:", childElementNodes[i].getAttribute("class"));
  }
}
```

# Attributes & Properties
## Attributes
####Learning objectives
- explain difference between attribute and property
- set an arbitrary attribute for a given set of Nodes
- set the class property of a given set of Nodes
- get the .value property of a a text field

```js
document.body.firstElementChild.setAttribute("class", "teachers");
```

Exercise:
- write a method that gives each li in the ul a 'groovy' attribute set to 'true'

```js

function setChildrenToGroovy(ulNode){
  var childElementNodes = ulNode.children
  for (var i = 0; i < childElementNodes.length; i++){
    childElementNodes[i].setAttribute("groovy", true);
  }
}

```
## Properties

Properties
- may have any value
- do not effect html
- can be any object, including functions
- case sensitive


Attributes
- can only be strings
- not case sensitive
- they show up in innerHTML
- can list all attributes
class vs className

```js
//this won't really work
function setClassProperty(inputNode){
  inputNode.class = "blue";
  console.log("inputNode.class:", inputNode.class)
}

function setClassAttribute(inputNode){
  inputNode.setAttribute("class", "blue");
  console.log("inputNode.getAttribute('class')", inputNode.getAttribute("class"))
}

function setClassAttribute(inputNode){
  inputNode.className = "blue";
  console.log("inputNode.className", inputNode.className )
}

```



```js
function getInput(inputNode){
  inputNode.setAttribute('value', 'love');
  console.log(".value", inputNode.value);
  console.log("getAttribute('value')", inputNode.getAttribute('value'));
}
```

Sometimes attributes and properties sync up.  This is very weird.  
```js
document.body.id = "fun"
document.body.getAttribute("id");
document.body.setAttribute("id", "sadness");
document.body.id;

```

Sometimes the syncing is only unidirectional
```js
input = document.getElementsByTagName('input')[0];
input.setAttribute('value', 'lemurs');


input.value = "raptors";
input.getAttribute('value')
```


value property vs attribute

![](attr_prop.png)

Show style.  

Exercise  

- Write a method that sets the class of blue circles to 'circle'


# FINDING ELEMENTS IN THE DOM
####Learning objectives
- get an element by its id
- get a set of elements by tag name
- get a set of elements by class name and modify their properties

## document.getElementById
```js
 document.getElementById('teachers');
```
## document.getElementsByTagName
```js
  document.getElementsByTagName('li');
```
Exercise:
- Write a function that changes all instances of a given tag to a specified font.

```js
function changeTagFont(tagName, fontFamily){
  var elems = document.getElementsByTagName(tagName)
  for (var i = 0; i < elems.length; i++){
    elems[i].style.fontFamily = fontFamily;
  }
}
```

We can call these methods on DOM objets as well as the document.  

Exercise:

Write a method that takes a ul's id as an argument.  It should return that ul's lis.

```js
  function returnLis(ulId){
    var ulElem   = document.getElementById(ulId);
    var liElems  = ulElem.getElementsByTagName('li');
    return liElems;
  }
```

other methods:

## document.getElementsByName

## document/node.getElementsByClassName

Exercise:

- Write a function that: makes the background color of all objects with class 'red'...red.

```js
  function colorize(color){
    var elems = document.getElementsByClassName('colorifiable');
    for (var i = 0; i < elems.length; i++){
      elems[i].style.backGroundColor = color;
    }
  }

```

# MODIFYING LE DOM
####Learning objectives
- create an element using document.createElement
- create a text node using document.createTextNode
- append an element to the DOM using appendChild and insertBefore
- remove and replace an element in the DOM

## Creating elements
### document.createElement(tag)

Exercise, write a function buildrs(num, size) that returns an array (length = num) of divs (height and width = size)

```js
  function buildSquares(num, size){
    var elems = [];
    for (var i = 0; i < num; i++){
      var square = document.createElement('div')
      square.style.width = size+"px";
      square.style.height = size+"px";
      elems.push(square)
    }
    return elems
  }
```



### document.createTextNode()


```js
  function buildSmileyFace(num, size){
    var elems = [];
    for (var i = 0; i < num; i++){
      var square = document.createElement('div')
      square.style.width = size+"px";
      square.style.height = size+"px";
      square.style.borderRadius = size/2;
      var textNode = document.createTextNode('^_^');
      square.appendChild(textNode);
      elems.push(square)
    }
    return elems
  }
```
You might be asking, what is the difference between innerHTML / createTextNode?

Exercise: Run the following code in the browser.

```js
  var elem = document.body.innerHTML = '<h1>Andrew Smells</h1>';
  var elem = document.createTextNode('<h1>Andrew Smells</h1>');
  document.body.appendChild(elem);

```

This is a nice segue into adding elements to the DOM

## Adding elements to the DOM
### parentElem.appendChild(elem)
This method allows is to append child elements to a parent.
```js
function buildSmileyFaces(num, size){
  var elems = [];
  for (var i = 0; i < num; i++){
    var square = document.createElement('div')
    square.style.width = size+"px";
    square.style.height = size+"px";
    square.style.textAlign = "center";
    square.style.fontSize = size/2;
    square.style.borderRadius = size/2;
    square.style.backgroundColor = 'yellow';
    var textNode = document.createTextNode('^_^');
    square.appendChild(textNode);
    elems.push(square)
  }
  return elems;
}
function buildSmileyUl(num, size){
  var elems  = buildSmileyFace(num, size);
  var ulElem = document.getElementById('smileys');
  for (var i = 0; i < elems.length; i++){
    ulElem.appendChild(elems[i]);
  }
  document.body.appendChild(ulElem);
}

```

Exercise:
- Write a new function that returns a random color.  Call it in your build smileys method so that the color is set to something other than yellow.

```js
function randomColor(){
  var colors = ["red", "green", "blue"];
  var randomIndex = parseInt(Math.random()*colors.length);
  return colors[randomIndex];
}
```


## parentElem.insertBefore(elem, nextSibling)

Exercise: using insertBefore, write a function (or functions) that prepends lis with each lemur name.


```js
var lemurs = [
  "Annie Bae",
  "Carson Bills",
  "John Boese",
  "Denise Burgess",
  "Christian Clifford",
  "Aaron Delaplane",
  "Palermo Deschamps",
  "Karynn Tran (Elio)",
  "Michael Gherard",
  "Manini Gupta",
  "Thomas Haynsworth",
  "Anderson Holderness",
  "Clarissa Jaime",
  "alisha kassam",
  "Amanda Kievet",
  "Isul Kim",
  "Dave Koenig",
  "James Liu",
  "Edward Mahoney",
  "Thareef Marzook",
  "Peter Michalakis",
  "Marc Plotkin",
  "Michael Prude",
  "Evan Turner",
  "Vadim Volovodovskiy",
  "Conrad Wells",
  "Bob Wilkie",
  "Gray Yeargin",
  "Ian Schmertzler"
]
function createLiNodes(arr){
  elems = [];
  for (var i = 0; i < arr.length; i++){
    var textNode = document.createTextNode(arr[i]);
    var liNode   = document.createElement('li');
    liNode.appendChild(textNode);
    elems.push(liNode);  
  }
  return elems;
}


function prependLis(UlId, arr){
  var liNodes = createLiNodes(arr)
  var ulEl = document.getElementById('lemurs');
  for (var i = 0; i < liNodes.length; i++){
    ulEl.insertBefore(liNodes[i], liNodes[i-1]);
  }
}


```

## Removing Nodes
### parentElem.removeChild(elem)
Remove the elem from the children of parentElem.

### parentElem.replaceChild(elem, currentElem)
Replace the child element of parentElem, referenced by currentElem with the elem.


Remove Andrew from teacher's list

```js

      function findTeacher(name){
        var teachersUlEl = document.getElementById('teachers');
        var teacherLis = teachersUlEl.getElementsByTagName('li');
        for (var i = 0; i < teacherLis.length; i++){
          if (teacherLis[i].innerHTML.replace(/ /g,'') == name){
            return teacherLis[i];
          }
        }
      }

  function removeTeacher(teacher){
    var teachersUlEl = document.getElementById('teachers');
    var teacherEl = findTeacher(teacher);
    teachersUlEl.removeChild(teacherEl);
  }


```
Exercise: Write another function (or functions), replaceTeacher(newTeacher, oldTeacher).  It should replace an old teacher with a newly created teacher li.

```js

function replaceTeacher(newTeacherName, oldTeacherName){
  var oldTeach = findTeacher(oldTeacherName);
  var newTeach = document.createElement('li')
  newTeach.innerHTML = newTeacherName;
  var teachersUlEl = document.getElementById('teachers');
  teachersUlEl.replaceChild(newTeach, oldTeach);
}

```


# Miscellaneous
## window.onload

## addEventListener
