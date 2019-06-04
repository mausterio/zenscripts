// Author: Tim Vitale (Mausterio)
// Used on the GoodGangSociety ATM 3: Remix Server, goodgangsociety.com:25595
// License: MIT - https://github.com/mausterio/zenscripts/blob/master/LICENSE

// This script allows for players to generate good ol currency while playing.
// The goal is to incentivize players to passively accumulate currency that 
// may be used for player to player trading, while being restrictive enough to
// prevent rapid devaluation of currency.

// Messy imports, need to be cleaned up once script is completed.
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityDrop;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// Declares coins
var coin_penny = <modcurrency:coin:0>;
var coin_nickle = <modcurrency:coin:1>;
var coin_dime = <modcurrency:coin:2>;
var coin_quarter = <modcurrency:coin:3>;
var coin_dollar = <modcurrency:coin:4>;
var coin_two_dollar = <modcurrency:coin:5>;

// Declares bills
var bill_one_dollar = <modcurrency:banknote:0>;
var bill_five_dollar = <modcurrency:banknote:1>;
var bill_ten_dollar = <modcurrency:banknote:2>;
var bill_twenty_dollar = <modcurrency:banknote:3>;
var bill_fifty_dollar = <modcurrency:banknote:4>;
var bill_hundred_dollar = <modcurrency:banknote:5>;

// Add money drops to mobs
// The idea is to allow currency to drop on mobs that arent easily mass-farmed
// TODO: Add drop chances as well as min-max amounts

	var troll = <entity:primitivemobs:trollager>;  // Requires Primitive Mobs
		troll.addPlayerOnlyDrop(bill_one_dollar, 1, 4, 0.30);
		troll.addPlayerOnlyDrop(bill_five_dollar, 1, 1, 0.30);
		troll.addPlayerOnlyDrop(bill_ten_dollar, 1, 1, 0.30);
		
	var goblin = <entity:primitivemobs:goblin>; // Requires Primitive Mobs
		goblin.addPlayerOnlyDrop(coin_nickle, 1, 1, 0.30);
		goblin.addPlayerOnlyDrop(coin_penny, 1, 4, 0.60);
		
	var merchant = <entity:primitivemobs:traveling_merchant>; // Requires Primitive Mobs
		merchant.addPlayerOnlyDrop(bill_one_dollar, 1, 4, 0.50);
		merchant.addPlayerOnlyDrop(bill_five_dollar, 1, 1, 0.30);
		
	var sheepman = <entity:primitivemobs:sheepman>; // Requires Primitive Mobs
		sheepman.addPlayerOnlyDrop(coin_nickle, 1, 1, 0.30);
		sheepman.addPlayerOnlyDrop(coin_penny, 1, 4, 0.60);
		
		
// Add recipes for crafting
// Disclaimer: These wont show up clientside in mods like JEI unless the client also has this script
	furnace.addRecipe(coin_penny, <ore:plateCopper>); // Requires Thermal Foundation
	furnace.addRecipe(coin_quarter, <ore:plateAdvancedAlloy>); // Requires Industrial Craft 2
	furnace.addRecipe(coin_two_dollar, <ore:plateIridiumAlloy>); // Requires Industrial Craft 2
