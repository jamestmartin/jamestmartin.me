/**
 * Returns a random number between min (inclusive) and max (exclusive)
 */
function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
}

function rolln(n, x) {
    var total = 0;
    while (n-- > 0) {
        total += getRandomArbitrary(1, x);
    }
    return total;
}

function roll(x) {
    return rolln(1, x);
}

function skillCheck(bonus) {
    return roll(20) + bonus;
}

function parseIfPresent(x) {
    return x ? parseInt(x) : 0;
}

function isBody(elem) {
    return elem.getElementsByTagName('td').length > 0;
}

function getRows(id) {
    var rows = document.getElementById(id).getElementsByTagName('tr');
    var bodyrows = Array.from(rows).filter(isBody);
    return bodyrows;
}

function printWithSign(x) {
    if (x > 0) {
        return "+" + x.toString();
    } else if (x == 0) {
        return "";
    } else {
        return x.toString();
    }
}

function abilityModifier(ability) {
    return (ability - 10) / 2
}

window.onload = function() {
    var skillsHeaders = document.getElementById("skills-headers");
    var bonusHeader = document.createElement('th');
    bonusHeader.append(document.createTextNode("Bonus"));
    skillsHeaders.append(bonusHeader);

    var abilities = new Object();
    var abilityRows = getRows('ability-scores');
    
    for (let ability of abilityRows) {
        var columns = ability.getElementsByTagName('td');
        
        var name = columns[0].innerText;
        var bonus = parseInt(columns[2].innerText);

        abilities[name] = bonus;
    }
    
    var skillRows = getRows('skills-table');

    var classRankBonus = 8;
    var totalRankBonus = classRankBonus + abilities['Int'];
    var initialRanks = 4 * totalRankBonus;
    var level = 1;
    var levelRanks = (level - 1) * totalRankBonus;
    var maxRanks = initialRanks + levelRanks;
    var totalRanks = 0;

    for (let skill of skillRows) {
        var columns = skill.getElementsByTagName('td');

        var abilityColumn = columns[1].innerText;
        var rankColumn = columns[2].innerText;
        var extraColumn = columns[3].innerText;

        var abilityBonus = abilities[abilityColumn];
        var rankBonus = parseIfPresent(rankColumn);
        var extraBonus = parseIfPresent(extraColumn);
        var totalBonus = abilityBonus + rankBonus + extraBonus;

        var totalBonusText = printWithSign(totalBonus);

        var totalBonusColumn = document.createElement('td');
        totalBonusColumn.append(document.createTextNode(totalBonusText));
        skill.append(totalBonusColumn);

        totalRanks += rankBonus;
    }

    var remainingRanks = maxRanks - totalRanks;

    var skillPointNotice = document.createElement('p');
    skillPointNotice.append(document.createTextNode('Total skill points remaining: '));
    skillPointNotice.append(document.createTextNode(remainingRanks.toString()));
    skillPointNotice.append(document.createTextNode('/'));
    skillPointNotice.append(document.createTextNode(maxRanks.toString()));
    
    document.getElementById('skill-points').append(skillPointNotice);
}
