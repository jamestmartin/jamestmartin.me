window.onload = function() {
    var skillsHeaders = document.getElementById("skills-headers");
    var bonusHeader = document.createElement('th');
    bonusHeader.append(document.createTextNode("Bonus"));
    skillsHeaders.append(bonusHeader);

    var abilities = new Object();
    var abilityRows =
        document.getElementById("ability-scores").getElementsByTagName('tr');
    
    for (let ability of abilityRows) {
        var columns = ability.getElementsByTagName('td');
        if (columns.length != 3) {
            // This row contains headers, not values.
            continue;
        }
        
        var name = columns[0].innerText;
        var bonus = parseInt(columns[2].innerText);

        abilities[name] = bonus;
    }
    
    var skillRows =
        document.getElementById("skills-table").getElementsByTagName('tr');

    for (let skill of skillRows) {
        var columns = skill.getElementsByTagName('td');
        if (columns.length != 4) {
            // This row contains headers, not values.
            continue;
        }

        var abilityColumn = columns[1].innerText;
        var rankColumn = columns[2].innerText;
        var extraColumn = columns[3].innerText;

        var abilityBonus = abilities[abilityColumn];
        var rankBonus = parseInt(rankColumn);
        var extraBonus = extraColumn ? parseInt(extraColumn) : 0;
        var totalBonus = abilityBonus + rankBonus + extraBonus;

        var totalBonusText;
        if (totalBonus >= 0) {
            totalBonusText = "+" + totalBonus.toString();
        } else {
            totalBonusText = totalBonus.toString();
        }

        var totalBonusColumn = document.createElement('td');
        totalBonusColumn.append(document.createTextNode(totalBonusText));
        skill.append(totalBonusColumn);
    }
}
