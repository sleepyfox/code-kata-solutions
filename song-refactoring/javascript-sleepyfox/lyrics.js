// We wouldn't need this if we had a _real_ collections library rather than the standard JS lib
pairs = require('./pairs')

const LINE = '\n'
const FIRST = 0
const SECOND = 1

// At some point this could become a proper Animals class, rather than the
// 'bag of config' object that it is at the moment
//
const Animals = {
    animals: [ { name: 'horse', exclamation: "...She's dead, of course!" },
	       { name: 'cow', exclamation: "I don't know how she swallowed a cow!" },
	       { name: 'dog', exclamation: 'What a hog, to swallow a dog!' },
	       { name: 'cat', exclamation: 'Fancy that to swallow a cat!' },
	       { name: 'bird', exclamation: 'How absurd to swallow a bird.' },
	       { name: 'spider', exclamation: 'That wriggled and wiggled and tickled inside her.' },
	       { name: 'fly', exclamation: "I don't know why she swallowed a fly - perhaps she'll die!" } ],
    num_verses: function(){ return this.animals.length },
    last: function(n) {
	return this.animals.slice(this.num_verses() - n, this.num_verses() )
    }
}


// Generic helper function; again in other languages the standard lib would provide this 
function range(n) {
    return Array(n).fill().map((_, i) => i + 1)
}

//
// Solution-specific code below
//
function opening_line(animal, verse = 'middle'){
    var ending = { first: '.', middle: ';', last: '...' }
    return `There was an old lady who swallowed a ${ animal }${ ending[verse] }`
}

function internal_lines(animals){
    function swallow_a(pair) {
	let predator = pair[FIRST].name
	let prey = pair[SECOND].name 
	return `She swallowed the ${predator} to catch the ${prey}`
    }
    return pairs(animals).map(swallow_a).join(',\n') + ";"
}

function verse(n) {
    let my_animals = Animals.last(n)
    let first_animal = my_animals[FIRST]

    let closing_line = "I don't know why she swallowed a fly - perhaps she'll die!"
    let core_lines = internal_lines(my_animals)
    var lines = []

    if (n === 1) {
	let opening = opening_line(first_animal.name, 'first')
	lines = [opening, first_animal.exclamation, LINE]
    } else if (n === Animals.num_verses()) {
	let opening = opening_line(first_animal.name, 'last')
	lines = [opening, first_animal.exclamation]
    } else {
	let opening = opening_line(first_animal.name)
	lines = [opening, first_animal.exclamation, core_lines, closing_line, LINE]
    }
    return lines.join(LINE)
}

module.exports = function () {
    return range(Animals.num_verses()).map(n => verse(n)).join('')
}()
