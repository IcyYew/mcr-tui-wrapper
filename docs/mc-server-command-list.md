command: advancement
    description: Gives/Removes/Checks player advancements
    syntax: advancement (grant|revoke) <targets> <advancement> <criterion>
    arguments:
        grant|revoke: Specifies granting or removing the to-be specified advancement
        targets: entity; Specifies one player or more. Must be player name, target selector of player type, or UUID.
        advancement: resource_location; Specifies a valid resource location of the advancement targetted, minecraft:story/*
        criterion: specifies a valid criterion for an advancement to manipulate, w/o this command defaults to entire advancement
