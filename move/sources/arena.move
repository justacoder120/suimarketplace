module sui_marketplace::arena;

use sui_marketplace::hero::{Self, Hero};
use sui::event;

// ========= STRUCTS =========

public struct Arena has key, store {
    id: UID,
    warrior: Hero,
    owner: address,
}

// ========= EVENTS =========

public struct ArenaCreated has copy, drop {
    arena_id: ID,
    timestamp: u64,
}

public struct ArenaCompleted has copy, drop {
    winner_hero_id: ID,
    loser_hero_id: ID,
    timestamp: u64,
}

// ========= FUNCTIONS =========

public fun create_arena(hero: Hero, ctx: &mut TxContext) {

    // TODO: Create an arena object
    let arena = Arena {
        id: object::new(ctx),
        warrior: hero,
        owner: ctx.sender(),
    };

    // TODO: Emit ArenaCreated event
    event::emit(ArenaCreated {
        arena_id: object::id(&arena),
        timestamp: ctx.epoch_timestamp_ms(),
    });

    // TODO: Use transfer::share_object()
    transfer::share_object(arena);
}

#[allow(lint(self_transfer))]
public fun battle(hero: Hero, arena: Arena, ctx: &mut TxContext) {
    
    // TODO: Implement battle logic
    let Arena { id, warrior, owner } = arena;

    // TODO: Compare hero.hero_power() with warrior.hero_power()
    if (hero::hero_power(&hero) > hero::hero_power(&warrior)) {
        // Hero wins
        
        // TODO: Emit BattlePlaceCompleted event with winner/loser IDs (BEFORE transfer)
        event::emit(ArenaCompleted {
            winner_hero_id: object::id(&hero),
            loser_hero_id: object::id(&warrior),
            timestamp: ctx.epoch_timestamp_ms(),
        });

        // Transfer heroes to winner (ctx.sender())
        transfer::public_transfer(hero, ctx.sender());
        transfer::public_transfer(warrior, ctx.sender());
        
    } else {
        // Warrior (arena owner's hero) wins

        // TODO: Emit BattlePlaceCompleted event with winner/loser IDs (BEFORE transfer)
        event::emit(ArenaCompleted {
            winner_hero_id: object::id(&warrior),
            loser_hero_id: object::id(&hero),
            timestamp: ctx.epoch_timestamp_ms(),
        });
        
        // Transfer heroes to winner (owner)
        transfer::public_transfer(hero, owner);
        transfer::public_transfer(warrior, owner);
    };

    // TODO: Delete the battle place ID 
    object::delete(id);
}
