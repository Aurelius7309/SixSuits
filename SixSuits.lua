--- STEAMODDED HEADER
--- MOD_NAME: Six Suits
--- MOD_ID: SixSuits
--- MOD_AUTHOR: [Aure, CrimsonHeart]
--- MOD_DESCRIPTION: This mod adds two new suits to the game. They can be enabled when starting a game using all registered decks.

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.SixSuit()
    local six_suit_mod = SMODS.findModByID('SixSuits')
    local sprite_cards_1 = SMODS.Sprite:new('cards_1', six_suit_mod.path, '8BitDeck.png', 71, 95, 'asset_atli')
    local sprite_cards_2 = SMODS.Sprite:new('cards_2', six_suit_mod.path, '8BitDeck_opt2.png', 71, 95, 'asset_atli')
    local sprite_ui_1 = SMODS.Sprite:new('ui_1', six_suit_mod.path, 'ui_assets.png', 18, 18, 'asset_atli')
    local sprite_ui_2 = SMODS.Sprite:new('ui_2', six_suit_mod.path, 'ui_assets_opt2.png', 18, 18, 'asset_atli')
    sprite_cards_1:register()
    sprite_cards_2:register()
    sprite_ui_1:register()
    sprite_ui_2:register()
    G.C.SUITS.Stars = HEX('DF509F')
    G.C.SO_1.Stars = HEX('DF509F')
    G.C.SO_2.Stars = HEX('DF509F')
    G.C.SUITS.Moons = HEX('696076')
    G.C.SO_1.Moons = HEX('696076')
    G.C.SO_2.Moons = HEX('696076')
    G.localization.misc['suits_plural']['Stars'] = 'Stars'
    G.localization.misc['suits_plural']['Moons'] = 'Moons'
    G.localization.misc['suits_singular']['Stars'] = 'Star'
    G.localization.misc['suits_singular']['Moons'] = 'Moon'
    G.six_suits = false
    for k,v in pairs(G.CHALLENGES) do
        v = v or {}
        v.deck = v.deck or {}
        v.deck.no_suits = v.deck.no_suits or {}
        v.deck.no_suits.R = true
        v.deck.no_suits.M = true
    end

    G.P_CARDS = {
        H_2 = { name = "2 of Hearts", value = '2', suit = 'Hearts', pos = { x = 0, y = 0 } },
        H_3 = { name = "3 of Hearts", value = '3', suit = 'Hearts', pos = { x = 1, y = 0 } },
        H_4 = { name = "4 of Hearts", value = '4', suit = 'Hearts', pos = { x = 2, y = 0 } },
        H_5 = { name = "5 of Hearts", value = '5', suit = 'Hearts', pos = { x = 3, y = 0 } },
        H_6 = { name = "6 of Hearts", value = '6', suit = 'Hearts', pos = { x = 4, y = 0 } },
        H_7 = { name = "7 of Hearts", value = '7', suit = 'Hearts', pos = { x = 5, y = 0 } },
        H_8 = { name = "8 of Hearts", value = '8', suit = 'Hearts', pos = { x = 6, y = 0 } },
        H_9 = { name = "9 of Hearts", value = '9', suit = 'Hearts', pos = { x = 7, y = 0 } },
        H_T = { name = "10 of Hearts", value = '10', suit = 'Hearts', pos = { x = 8, y = 0 } },
        H_J = { name = "Jack of Hearts", value = 'Jack', suit = 'Hearts', pos = { x = 9, y = 0 } },
        H_Q = { name = "Queen of Hearts", value = 'Queen', suit = 'Hearts', pos = { x = 10, y = 0 } },
        H_K = { name = "King of Hearts", value = 'King', suit = 'Hearts', pos = { x = 11, y = 0 } },
        H_A = { name = "Ace of Hearts", value = 'Ace', suit = 'Hearts', pos = { x = 12, y = 0 } },
        C_2 = { name = "2 of Clubs", value = '2', suit = 'Clubs', pos = { x = 0, y = 1 } },
        C_3 = { name = "3 of Clubs", value = '3', suit = 'Clubs', pos = { x = 1, y = 1 } },
        C_4 = { name = "4 of Clubs", value = '4', suit = 'Clubs', pos = { x = 2, y = 1 } },
        C_5 = { name = "5 of Clubs", value = '5', suit = 'Clubs', pos = { x = 3, y = 1 } },
        C_6 = { name = "6 of Clubs", value = '6', suit = 'Clubs', pos = { x = 4, y = 1 } },
        C_7 = { name = "7 of Clubs", value = '7', suit = 'Clubs', pos = { x = 5, y = 1 } },
        C_8 = { name = "8 of Clubs", value = '8', suit = 'Clubs', pos = { x = 6, y = 1 } },
        C_9 = { name = "9 of Clubs", value = '9', suit = 'Clubs', pos = { x = 7, y = 1 } },
        C_T = { name = "10 of Clubs", value = '10', suit = 'Clubs', pos = { x = 8, y = 1 } },
        C_J = { name = "Jack of Clubs", value = 'Jack', suit = 'Clubs', pos = { x = 9, y = 1 } },
        C_Q = { name = "Queen of Clubs", value = 'Queen', suit = 'Clubs', pos = { x = 10, y = 1 } },
        C_K = { name = "King of Clubs", value = 'King', suit = 'Clubs', pos = { x = 11, y = 1 } },
        C_A = { name = "Ace of Clubs", value = 'Ace', suit = 'Clubs', pos = { x = 12, y = 1 } },
        D_2 = { name = "2 of Diamonds", value = '2', suit = 'Diamonds', pos = { x = 0, y = 2 } },
        D_3 = { name = "3 of Diamonds", value = '3', suit = 'Diamonds', pos = { x = 1, y = 2 } },
        D_4 = { name = "4 of Diamonds", value = '4', suit = 'Diamonds', pos = { x = 2, y = 2 } },
        D_5 = { name = "5 of Diamonds", value = '5', suit = 'Diamonds', pos = { x = 3, y = 2 } },
        D_6 = { name = "6 of Diamonds", value = '6', suit = 'Diamonds', pos = { x = 4, y = 2 } },
        D_7 = { name = "7 of Diamonds", value = '7', suit = 'Diamonds', pos = { x = 5, y = 2 } },
        D_8 = { name = "8 of Diamonds", value = '8', suit = 'Diamonds', pos = { x = 6, y = 2 } },
        D_9 = { name = "9 of Diamonds", value = '9', suit = 'Diamonds', pos = { x = 7, y = 2 } },
        D_T = { name = "10 of Diamonds", value = '10', suit = 'Diamonds', pos = { x = 8, y = 2 } },
        D_J = { name = "Jack of Diamonds", value = 'Jack', suit = 'Diamonds', pos = { x = 9, y = 2 } },
        D_Q = { name = "Queen of Diamonds", value = 'Queen', suit = 'Diamonds', pos = { x = 10, y = 2 } },
        D_K = { name = "King of Diamonds", value = 'King', suit = 'Diamonds', pos = { x = 11, y = 2 } },
        D_A = { name = "Ace of Diamonds", value = 'Ace', suit = 'Diamonds', pos = { x = 12, y = 2 } },
        S_2 = { name = "2 of Spades", value = '2', suit = 'Spades', pos = { x = 0, y = 3 } },
        S_3 = { name = "3 of Spades", value = '3', suit = 'Spades', pos = { x = 1, y = 3 } },
        S_4 = { name = "4 of Spades", value = '4', suit = 'Spades', pos = { x = 2, y = 3 } },
        S_5 = { name = "5 of Spades", value = '5', suit = 'Spades', pos = { x = 3, y = 3 } },
        S_6 = { name = "6 of Spades", value = '6', suit = 'Spades', pos = { x = 4, y = 3 } },
        S_7 = { name = "7 of Spades", value = '7', suit = 'Spades', pos = { x = 5, y = 3 } },
        S_8 = { name = "8 of Spades", value = '8', suit = 'Spades', pos = { x = 6, y = 3 } },
        S_9 = { name = "9 of Spades", value = '9', suit = 'Spades', pos = { x = 7, y = 3 } },
        S_T = { name = "10 of Spades", value = '10', suit = 'Spades', pos = { x = 8, y = 3 } },
        S_J = { name = "Jack of Spades", value = 'Jack', suit = 'Spades', pos = { x = 9, y = 3 } },
        S_Q = { name = "Queen of Spades", value = 'Queen', suit = 'Spades', pos = { x = 10, y = 3 } },
        S_K = { name = "King of Spades", value = 'King', suit = 'Spades', pos = { x = 11, y = 3 } },
        S_A = { name = "Ace of Spades", value = 'Ace', suit = 'Spades', pos = { x = 12, y = 3 } },
        R_2 = { name = "2 of Stars", value = '2', suit = 'Stars', pos = { x = 0, y = 4 } },
        R_3 = { name = "3 of Stars", value = '3', suit = 'Stars', pos = { x = 1, y = 4 } },
        R_4 = { name = "4 of Stars", value = '4', suit = 'Stars', pos = { x = 2, y = 4 } },
        R_5 = { name = "5 of Stars", value = '5', suit = 'Stars', pos = { x = 3, y = 4 } },
        R_6 = { name = "6 of Stars", value = '6', suit = 'Stars', pos = { x = 4, y = 4 } },
        R_7 = { name = "7 of Stars", value = '7', suit = 'Stars', pos = { x = 5, y = 4 } },
        R_8 = { name = "8 of Stars", value = '8', suit = 'Stars', pos = { x = 6, y = 4 } },
        R_9 = { name = "9 of Stars", value = '9', suit = 'Stars', pos = { x = 7, y = 4 } },
        R_T = { name = "10 of Stars", value = '10', suit = 'Stars', pos = { x = 8, y = 4 } },
        R_J = { name = "Jack of Stars", value = 'Jack', suit = 'Stars', pos = { x = 9, y = 4 } },
        R_Q = { name = "Queen of Stars", value = 'Queen', suit = 'Stars', pos = { x = 10, y = 4 } },
        R_K = { name = "King of Stars", value = 'King', suit = 'Stars', pos = { x = 11, y = 4 } },
        R_A = { name = "Ace of Stars", value = 'Ace', suit = 'Stars', pos = { x = 12, y = 4 } },
        M_2 = { name = "2 of Moons", value = '2', suit = 'Moons', pos = { x = 0, y = 5 } },
        M_3 = { name = "3 of Moons", value = '3', suit = 'Moons', pos = { x = 1, y = 5 } },
        M_4 = { name = "4 of Moons", value = '4', suit = 'Moons', pos = { x = 2, y = 5 } },
        M_5 = { name = "5 of Moons", value = '5', suit = 'Moons', pos = { x = 3, y = 5 } },
        M_6 = { name = "6 of Moons", value = '6', suit = 'Moons', pos = { x = 4, y = 5 } },
        M_7 = { name = "7 of Moons", value = '7', suit = 'Moons', pos = { x = 5, y = 5 } },
        M_8 = { name = "8 of Moons", value = '8', suit = 'Moons', pos = { x = 6, y = 5 } },
        M_9 = { name = "9 of Moons", value = '9', suit = 'Moons', pos = { x = 7, y = 5 } },
        M_T = { name = "10 of Moons", value = '10', suit = 'Moons', pos = { x = 8, y = 5 } },
        M_J = { name = "Jack of Moons", value = 'Jack', suit = 'Moons', pos = { x = 9, y = 5 } },
        M_Q = { name = "Queen of Moons", value = 'Queen', suit = 'Moons', pos = { x = 10, y = 5 } },
        M_K = { name = "King of Moons", value = 'King', suit = 'Moons', pos = { x = 11, y = 5 } },
        M_A = { name = "Ace of Moons", value = 'Ace', suit = 'Moons', pos = { x = 12, y = 5 } }
    }

    function get_starting_params()
        return {
            dollars = 4,
            hand_size = 8,
            discards = 3,
            hands = 4,
            reroll_cost = 5,
            joker_slots = 5,
            ante_scaling = 1,
            consumable_slots = 2,
            no_faces = false,
            erratic_suits_and_ranks = false,
            six_suits = false
        }
    end

    Card.set_base_ref = Card.set_base
    function Card:set_base(card, initial)
        self:set_base_ref(card, initial)
        if self.base.suit == 'Stars' then
            self.base.suit_nominal = 0.05; self.base.suit_nominal_original = self.base.suit_nominal_original or 0.005
        elseif self.base.suit == 'Moons' then
            self.base.suit_nominal = 0.06; self.base.suit_nominal_original = self.base.suit_nominal_original or 0.006
        end
    end

    function Card:change_suit(new_suit)
        local new_code = (new_suit == 'Diamonds' and 'D_') or
            (new_suit == 'Spades' and 'S_') or
            (new_suit == 'Clubs' and 'C_') or
            (new_suit == 'Hearts' and 'H_') or
            (new_suit == 'Stars' and 'R_') or
            (new_suit == 'Moons' and 'M_')
        local new_val = (self.base.value == 'Ace' and 'A') or
            (self.base.value == 'King' and 'K') or
            (self.base.value == 'Queen' and 'Q') or
            (self.base.value == 'Jack' and 'J') or
            (self.base.value == '10' and 'T') or
            (self.base.value)
        local new_card = G.P_CARDS[new_code .. new_val]

        self:set_base(new_card)
        G.GAME.blind:debuff_card(self)
    end
end

--[[
Game.init_item_prototypes_ref = Game.init_item_prototypes
function Game:init_item_prototypes()
    self.P_CENTERS.c_moon = {
        order = 19,
        discovered = false,
        cost = 3,
        consumeable = true,
        name = "The Moon",
        pos = { x = 8, y = 1 },
        set =
        "Tarot",
        effect = "Suit Conversion",
        cost_mult = 1.0,
        config = { suit_conv = 'Moons', max_highlighted = 4 }
    }

    self:save_progress()
    self.P_CENTER_POOLS['Tarot_Planet'] = {}
    self.P_CENTER_POOLS['Joker'] = {}
    for k, v in pairs(self.P_CENTERS) do
        v.key = k
        if v.set == 'Joker' then table.insert(self.P_CENTER_POOLS['Joker'], v) end
        if v.set and v.demo and v.pos then table.insert(self.P_CENTER_POOLS['Demo'], v) end
        if not v.wip then
            if v.set and v.set ~= 'Joker' and not v.skip_pool and not v.omit then
                table.insert(
                    self.P_CENTER_POOLS[v.set], v)
            end
            if v.set == 'Tarot' or v.set == 'Planet' then table.insert(self.P_CENTER_POOLS['Tarot_Planet'], v) end
            if v.consumeable then table.insert(self.P_CENTER_POOLS['Consumeables'], v) end
            if v.rarity and v.set == 'Joker' and not v.demo then table.insert(self.P_JOKER_RARITY_POOLS[v.rarity], v) end
        end
    end
    table.sort(self.P_CENTER_POOLS["Tarot"], function(a, b) return a.order < b.order end)
    table.sort(self.P_CENTER_POOLS["Planet"], function(a, b) return a.order < b.order end)
    table.sort(self.P_CENTER_POOLS["Tarot_Planet"], function(a, b) return a.order < b.order end)
    table.sort(self.P_CENTER_POOLS["Spectral"], function(a, b) return a.order < b.order end)
end
]]


-- overwriting as there is no way to modify suits in the original function
function get_flush(hand)
    local ret = {}
    local four_fingers = next(find_joker('Four Fingers'))
    local suits = {
        "Spades",
        "Hearts",
        "Clubs",
        "Diamonds",
        "Stars",
        "Moons"
    }
    if #hand > 5 or #hand < (5 - (four_fingers and 1 or 0)) then
        return ret
    else
        for j = 1, #suits do
            local t = {}
            local suit = suits[j]
            local flush_count = 0
            for i = 1, #hand do
                if hand[i]:is_suit(suit, nil, true) then
                    flush_count = flush_count + 1; t[#t + 1] = hand[i]
                end
            end
            if flush_count >= (5 - (four_fingers and 1 or 0)) then
                table.insert(ret, t)
                return ret
            end
        end
        return {}
    end
end

function G.UIDEF.view_deck(unplayed_only)
    local deck_tables = {}
    remove_nils(G.playing_cards)
    G.VIEWING_DECK = true
    table.sort(G.playing_cards, function(a, b) return a:get_nominal('suit') > b:get_nominal('suit') end)
    local SUITS = {
        Spades = {},
        Hearts = {},
        Clubs = {},
        Diamonds = {},
        Stars = {},
        Moons = {}
    }
    local suit_map = { 'Spades', 'Hearts', 'Clubs', 'Diamonds', 'Stars', 'Moons' }
    for k, v in ipairs(G.playing_cards) do
        table.insert(SUITS[v.base.suit], v)
    end
    local num_suits = 0
    for j = 1, 6 do
        if SUITS[suit_map[j]][1] then num_suits = num_suits + 1 end
    end
    for j = 1, 6 do
        if SUITS[suit_map[j]][1] then
            local view_deck = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                6.5 * G.CARD_W,
                ((num_suits > 4) and (1-0.1*num_suits) or 0.6) * G.CARD_H,
                {
                    card_limit = #SUITS[suit_map[j]],
                    type = 'title',
                    view_deck = true,
                    highlight_limit = 0,
                    card_w = G.CARD_W * 0.6,
                    draw_layers = { 'card' }
                })
            table.insert(deck_tables,
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0 },
                    nodes = {
                        { n = G.UIT.O, config = { object = view_deck } }
                    }
                }
            )

            for i = 1, #SUITS[suit_map[j]] do
                if SUITS[suit_map[j]][i] then
                    local greyed, _scale = nil, 0.7
                    if unplayed_only and not ((SUITS[suit_map[j]][i].area and SUITS[suit_map[j]][i].area == G.deck) or SUITS[suit_map[j]][i].ability.wheel_flipped) then
                        greyed = true
                    end
                    local copy = copy_card(SUITS[suit_map[j]][i], nil, _scale)
                    copy.greyed = greyed
                    copy.T.x = view_deck.T.x + view_deck.T.w / 2
                    copy.T.y = view_deck.T.y

                    copy:hard_set_T()
                    view_deck:emplace(copy)
                end
            end
        end
    end

    local flip_col = G.C.WHITE

    local suit_tallies = { ['Spades'] = 0, ['Hearts'] = 0, ['Clubs'] = 0, ['Diamonds'] = 0, ['Stars'] = 0, ['Moons'] = 0 }
    local mod_suit_tallies = { ['Spades'] = 0, ['Hearts'] = 0, ['Clubs'] = 0, ['Diamonds'] = 0, ['Stars'] = 0, ['Moons'] = 0 }
    local rank_tallies = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    local mod_rank_tallies = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    local rank_name_mapping = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A' }
    local face_tally = 0
    local mod_face_tally = 0
    local num_tally = 0
    local mod_num_tally = 0
    local ace_tally = 0
    local mod_ace_tally = 0
    local wheel_flipped = 0

    for k, v in ipairs(G.playing_cards) do
        if v.ability.name ~= 'Stone Card' and (not unplayed_only or ((v.area and v.area == G.deck) or v.ability.wheel_flipped)) then
            if v.ability.wheel_flipped and unplayed_only then wheel_flipped = wheel_flipped + 1 end
            --For the suits
            suit_tallies[v.base.suit] = (suit_tallies[v.base.suit] or 0) + 1
            mod_suit_tallies['Spades'] = (mod_suit_tallies['Spades'] or 0) + (v:is_suit('Spades') and 1 or 0)
            mod_suit_tallies['Hearts'] = (mod_suit_tallies['Hearts'] or 0) + (v:is_suit('Hearts') and 1 or 0)
            mod_suit_tallies['Clubs'] = (mod_suit_tallies['Clubs'] or 0) + (v:is_suit('Clubs') and 1 or 0)
            mod_suit_tallies['Diamonds'] = (mod_suit_tallies['Diamonds'] or 0) + (v:is_suit('Diamonds') and 1 or 0)
            mod_suit_tallies['Stars'] = (mod_suit_tallies['Stars'] or 0) + (v:is_suit('Stars') and 1 or 0)
            mod_suit_tallies['Moons'] = (mod_suit_tallies['Moons'] or 0) + (v:is_suit('Moons') and 1 or 0)

            --for face cards/numbered cards/aces
            local card_id = v:get_id()
            face_tally = face_tally + ((card_id == 11 or card_id == 12 or card_id == 13) and 1 or 0)
            mod_face_tally = mod_face_tally + (v:is_face() and 1 or 0)
            if card_id > 1 and card_id < 11 then
                num_tally = num_tally + 1
                if not v.debuff then mod_num_tally = mod_num_tally + 1 end
            end
            if card_id == 14 then
                ace_tally = ace_tally + 1
                if not v.debuff then mod_ace_tally = mod_ace_tally + 1 end
            end

            --ranks
            rank_tallies[card_id - 1] = rank_tallies[card_id - 1] + 1
            if not v.debuff then mod_rank_tallies[card_id - 1] = mod_rank_tallies[card_id - 1] + 1 end
        end
    end

    local modded = (face_tally ~= mod_face_tally) or
        (mod_suit_tallies['Spades'] ~= suit_tallies['Spades']) or
        (mod_suit_tallies['Hearts'] ~= suit_tallies['Hearts']) or
        (mod_suit_tallies['Clubs'] ~= suit_tallies['Clubs']) or
        (mod_suit_tallies['Diamonds'] ~= suit_tallies['Diamonds']) or
        (mod_suit_tallies['Stars'] ~= suit_tallies['Stars']) or
        (mod_suit_tallies['Moons'] ~= suit_tallies['Moons'])

    if wheel_flipped > 0 then flip_col = mix_colours(G.C.FILTER, G.C.WHITE, 0.7) end

    local rank_cols = {}
    for i = 13, 1, -1 do
        local mod_delta = mod_rank_tallies[i] ~= rank_tallies[i]
        rank_cols[#rank_cols + 1] = {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.07 },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm", r = 0.1, padding = 0.04, emboss = 0.04, minw = 0.5, colour = G.C.L_BLACK },
                    nodes = {
                        { n = G.UIT.T, config = { text = rank_name_mapping[i], colour = G.C.JOKER_GREY, scale = 0.35, shadow = true } },
                    }
                },
                {
                    n = G.UIT.C,
                    config = { align = "cr", minw = 0.4 },
                    nodes = {
                        mod_delta and
                        { n = G.UIT.O, config = { object = DynaText({ string = { { string = '' .. rank_tallies[i], colour = flip_col }, { string = '' .. mod_rank_tallies[i], colour = G.C.BLUE } }, colours = { G.C.RED }, scale = 0.4, y_offset = -2, silent = true, shadow = true, pop_in_rate = 10, pop_delay = 4 }) } } or
                        { n = G.UIT.T, config = { text = rank_tallies[i] or 'NIL', colour = flip_col, scale = 0.45, shadow = true } },
                    }
                }
            }
        }
    end


    local t =
    {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
            { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {} },
            {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm", minw = 1.5, minh = 2, r = 0.1, colour = G.C.BLACK, emboss = 0.05 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = { align = "cm", padding = 0.1 },
                                nodes = {
                                    {
                                        n = G.UIT.R,
                                        config = { align = "cm", r = 0.1, colour = G.C.L_BLACK, emboss = 0.05, padding = 0.15 },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm" },
                                                nodes = {
                                                    { n = G.UIT.O, config = { object = DynaText({ string = G.GAME.selected_back.loc_name, colours = { G.C.WHITE }, bump = true, rotate = true, shadow = true, scale = 0.6 - string.len(G.GAME.selected_back.loc_name) * 0.01 }) } },
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", r = 0.1, padding = 0.1, minw = 2.5, minh = 1.3, colour = G.C.WHITE, emboss = 0.05 },
                                                nodes = {
                                                    {
                                                        n = G.UIT.O,
                                                        config = {
                                                            object = UIBox {
                                                                definition = G.GAME.selected_back:generate_UI(nil, 0.7, 0.5, G.GAME.challenge),
                                                                config = { offset = { x = 0, y = 0 } }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        n = G.UIT.R,
                                        config = { align = "cm", r = 0.1, outline_colour = G.C.L_BLACK, line_emboss = 0.05, outline = 1.5 },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", minh = 0.05, padding = 0.07 },
                                                nodes = {
                                                    { n = G.UIT.O, config = { object = DynaText({ string = { { string = localize('k_base_cards'), colour = G.C.RED }, modded and { string = localize('k_effective'), colour = G.C.BLUE } or nil }, colours = { G.C.RED }, silent = true, scale = 0.4, pop_in_rate = 10, pop_delay = 4 }) } }
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", minh = 0.05, padding = 0.1 },
                                                nodes = {
                                                    tally_sprite({ x = 1, y = 0 },
                                                        { { string = '' .. ace_tally, colour = flip_col }, { string = '' .. mod_ace_tally, colour = G.C.BLUE } },
                                                        { localize('k_aces') }), --Aces
                                                    tally_sprite({ x = 2, y = 0 },
                                                        { { string = '' .. face_tally, colour = flip_col }, { string = '' .. mod_face_tally, colour = G.C.BLUE } },
                                                        { localize('k_face_cards') }), --Face
                                                    tally_sprite({ x = 3, y = 0 },
                                                        { { string = '' .. num_tally, colour = flip_col }, { string = '' .. mod_num_tally, colour = G.C.BLUE } },
                                                        { localize('k_numbered_cards') }), --Numbers
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", minh = 0.05, padding = 0.1 },
                                                nodes = {
                                                    tally_sprite({ x = 3, y = 1 },
                                                        { { string = '' .. suit_tallies['Spades'], colour = flip_col }, { string = '' .. mod_suit_tallies['Spades'], colour = G.C.BLUE } },
                                                        { localize('Spades', 'suits_plural') }),
                                                    tally_sprite({ x = 0, y = 1 },
                                                        { { string = '' .. suit_tallies['Hearts'], colour = flip_col }, { string = '' .. mod_suit_tallies['Hearts'], colour = G.C.BLUE } },
                                                        { localize('Hearts', 'suits_plural') }),
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", minh = 0.05, padding = 0.1 },
                                                nodes = {
                                                    tally_sprite({ x = 2, y = 1 },
                                                        { { string = '' .. suit_tallies['Clubs'], colour = flip_col }, { string = '' .. mod_suit_tallies['Clubs'], colour = G.C.BLUE } },
                                                        { localize('Clubs', 'suits_plural') }),
                                                    tally_sprite({ x = 1, y = 1 },
                                                        { { string = '' .. suit_tallies['Diamonds'], colour = flip_col }, { string = '' .. mod_suit_tallies['Diamonds'], colour = G.C.BLUE } },
                                                        { localize('Diamonds', 'suits_plural') }),
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", minh = 0.05, padding = 0.1 },
                                                nodes = {
                                                    tally_sprite({ x = 4, y = 1 },
                                                        { { string = '' .. suit_tallies['Stars'], colour = flip_col }, { string = '' .. mod_suit_tallies['Stars'], colour = G.C.BLUE } },
                                                        { localize('Stars', 'suits_plural') }),
                                                    tally_sprite({ x = 5, y = 1 },
                                                        { { string = '' .. suit_tallies['Moons'], colour = flip_col }, { string = '' .. mod_suit_tallies['Moons'], colour = G.C.BLUE } },
                                                        { localize('Moons', 'suits_plural') }),
                                                }
                                            },
                                        }
                                    }
                                }
                            },
                            { n = G.UIT.C, config = { align = "cm" },    nodes = rank_cols },
                            { n = G.UIT.B, config = { w = 0.1, h = 0.1 } },
                        }
                    },
                    { n = G.UIT.B, config = { w = 0.2, h = 0.1 } },
                    { n = G.UIT.C, config = { align = "cm", padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables }
                }
            },
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 0.8, padding = 0.05 },
                nodes = {
                    modded and {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            { n = G.UIT.C, config = { padding = 0.3, r = 0.1, colour = mix_colours(G.C.BLUE, G.C.WHITE, 0.7) },              nodes = {} },
                            { n = G.UIT.T, config = { text = ' ' .. localize('ph_deck_preview_effective'), colour = G.C.WHITE, scale = 0.3 } },
                        }
                    } or nil,
                    wheel_flipped > 0 and {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            { n = G.UIT.C, config = { padding = 0.3, r = 0.1, colour = flip_col }, nodes = {} },
                            {
                                n = G.UIT.T,
                                config = {
                                    text = ' ' .. (wheel_flipped > 1 and
                                        localize { type = 'variable', key = 'deck_preview_wheel_plural', vars = { wheel_flipped } } or
                                        localize { type = 'variable', key = 'deck_preview_wheel_singular', vars = { wheel_flipped } }),
                                    colour = G.C.WHITE,
                                    scale = 0.3
                                }
                            },
                        }
                    } or nil,
                }
            }
        }
    }
    return t
end

function G.UIDEF.deck_preview(args)
    local _minh, _minw = 0.35, 0.5
    local suit_labels = {}
    local suit_counts = {
        Spades = 0,
        Hearts = 0,
        Clubs = 0,
        Diamonds = 0,
        Stars = 0,
        Moons = 0
    }
    local mod_suit_counts = {
        Spades = 0,
        Hearts = 0,
        Clubs = 0,
        Diamonds = 0,
        Stars = 0,
        Moons = 0
    }
    local mod_suit_diff = false
    local wheel_flipped, wheel_flipped_text = 0, nil
    local flip_col = G.C.WHITE
    local rank_counts = {}
    local deck_tables = {}
    remove_nils(G.playing_cards)
    table.sort(G.playing_cards, function(a, b) return a:get_nominal('suit') > b:get_nominal('suit') end)
    local SUITS = {
        Spades = {},
        Hearts = {},
        Clubs = {},
        Diamonds = {},
        Stars = {},
        Moons = {},
    }

    for k, v in pairs(SUITS) do
        for i = 1, 14 do
            SUITS[k][#SUITS[k] + 1] = {}
        end
    end

    local suit_map = { 'Spades', 'Hearts', 'Clubs', 'Diamonds', 'Stars', 'Moons' }
    local stones = nil
    local rank_name_mapping = { 'A', 'K', 'Q', 'J', '10', 9, 8, 7, 6, 5, 4, 3, 2 }

    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect == 'Stone Card' then
            stones = stones or 0
        end
        if (v.area and v.area == G.deck) or v.ability.wheel_flipped then
            if v.ability.wheel_flipped then wheel_flipped = wheel_flipped + 1 end
            if v.ability.effect == 'Stone Card' then
                stones = stones + 1
            else
                for kk, vv in pairs(suit_counts) do
                    if v.base.suit == kk then suit_counts[kk] = suit_counts[kk] + 1 end
                    if v:is_suit(kk) then mod_suit_counts[kk] = mod_suit_counts[kk] + 1 end
                end
                if SUITS[v.base.suit][v.base.id] then
                    table.insert(SUITS[v.base.suit][v.base.id], v)
                end
                rank_counts[v.base.id] = (rank_counts[v.base.id] or 0) + 1
            end
        end
    end

    wheel_flipped_text = (wheel_flipped > 0) and
        { n = G.UIT.T, config = { text = '?', colour = G.C.FILTER, scale = 0.25, shadow = true } } or nil
    flip_col = wheel_flipped_text and mix_colours(G.C.FILTER, G.C.WHITE, 0.7) or G.C.WHITE

    suit_labels[#suit_labels + 1] = {
        n = G.UIT.R,
        config = { align = "cm", r = 0.1, padding = 0.04, minw = _minw, minh = 2 * _minh + 0.25 },
        nodes = {
            stones and
            { n = G.UIT.T, config = { text = localize('ph_deck_preview_stones') .. ': ', colour = G.C.WHITE, scale = 0.25, shadow = true } }
            or nil,
            stones and
            { n = G.UIT.T, config = { text = '' .. stones, colour = (stones > 0 and G.C.WHITE or G.C.UI.TRANSPARENT_LIGHT), scale = 0.4, shadow = true } }
            or nil,
        }
    }

    local _row = {}
    local _bg_col = G.C.JOKER_GREY
    for k, v in ipairs(rank_name_mapping) do
        local _tscale = 0.3
        local _colour = G.C.BLACK
        local rank_col = v == 'A' and _bg_col or (v == 'K' or v == 'Q' or v == 'J') and G.C.WHITE or _bg_col
        rank_col = mix_colours(rank_col, _bg_col, 0.8)

        local _col = {
            n = G.UIT.C,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm", r = 0.1, minw = _minw, minh = _minh, colour = rank_col, emboss = 0.04, padding = 0.03 },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm" },
                            nodes = {
                                { n = G.UIT.T, config = { text = '' .. v, colour = _colour, scale = 1.6 * _tscale } },
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = { align = "cm", minw = _minw + 0.04, minh = _minh, colour = G.C.L_BLACK, r = 0.1 },
                            nodes = {
                                { n = G.UIT.T, config = { text = '' .. (rank_counts[15 - k] or 0), colour = flip_col, scale = _tscale, shadow = true } }
                            }
                        }
                    }
                }
            }
        }
        table.insert(_row, _col)
    end
    table.insert(deck_tables, { n = G.UIT.R, config = { align = "cm", padding = 0.04 }, nodes = _row })

    for j = 1, 6 do
        _row = {}
        _bg_col = mix_colours(G.C.SUITS[suit_map[j]], G.C.L_BLACK, 0.7)
        for i = 14, 2, -1 do
            local _tscale = #SUITS[suit_map[j]][i] > 0 and 0.3 or 0.25
            local _colour = #SUITS[suit_map[j]][i] > 0 and flip_col or G.C.UI.TRANSPARENT_LIGHT

            local _col = {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.05, minw = _minw + 0.098, minh = _minh },
                nodes = {
                    { n = G.UIT.T, config = { text = '' .. #SUITS[suit_map[j]][i], colour = _colour, scale = _tscale, shadow = true, lang = G.LANGUAGES['en-us'] } },
                }
            }
            table.insert(_row, _col)
        end
        table.insert(deck_tables,
            { n = G.UIT.R, config = { align = "cm", r = 0.1, padding = 0.04, minh = 0.4, colour = _bg_col }, nodes = _row })
    end

    for k, v in ipairs(suit_map) do
        local _x = (v == 'Spades' and 3) or (v == 'Hearts' and 0) or (v == 'Clubs' and 2) or (v == 'Diamonds' and 1) or
            (v == 'Stars' and 4) or (v == 'Moons' and 5)
        local t_s = Sprite(0, 0, 0.3, 0.3, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
            { x = _x, y = 1 })
        t_s.states.drag.can = false
        t_s.states.hover.can = false
        t_s.states.collide.can = false

        if mod_suit_counts[v] ~= suit_counts[v] then mod_suit_diff = true end

        suit_labels[#suit_labels + 1] =
        {
            n = G.UIT.R,
            config = { align = "cm", r = 0.1, padding = 0.03, colour = G.C.JOKER_GREY },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm", minw = _minw, minh = _minh },
                    nodes = {
                        { n = G.UIT.O, config = { can_collide = false, object = t_s } }
                    }
                },
                {
                    n = G.UIT.C,
                    config = { align = "cm", minw = _minw * 2.4, minh = _minh, colour = G.C.L_BLACK, r = 0.1 },
                    nodes = {
                        { n = G.UIT.T, config = { text = '' .. suit_counts[v], colour = flip_col, scale = 0.3, shadow = true, lang = G.LANGUAGES['en-us'] } },
                        mod_suit_counts[v] ~= suit_counts[v] and
                        { n = G.UIT.T, config = { text = ' (' .. mod_suit_counts[v] .. ')', colour = mix_colours(G.C.BLUE, G.C.WHITE, 0.7), scale = 0.28, shadow = true, lang = G.LANGUAGES['en-us'] } } or
                        nil,
                    }
                }
            }
        }
    end


    local t =
    {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.JOKER_GREY, r = 0.1, emboss = 0.05, padding = 0.07 },
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", r = 0.1, emboss = 0.05, colour = G.C.BLACK, padding = 0.1 },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            { n = G.UIT.C, config = { align = "cm", padding = 0.04 }, nodes = suit_labels },
                            { n = G.UIT.C, config = { align = "cm", padding = 0.02 }, nodes = deck_tables }
                        }
                    },
                    mod_suit_diff and {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            { n = G.UIT.C, config = { padding = 0.3, r = 0.1, colour = mix_colours(G.C.BLUE, G.C.WHITE, 0.7) },              nodes = {} },
                            { n = G.UIT.T, config = { text = ' ' .. localize('ph_deck_preview_effective'), colour = G.C.WHITE, scale = 0.3 } },
                        }
                    } or nil,
                    wheel_flipped_text and {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            { n = G.UIT.C, config = { padding = 0.3, r = 0.1, colour = flip_col }, nodes = {} },
                            {
                                n = G.UIT.T,
                                config = {
                                    text = ' ' .. (wheel_flipped > 1 and
                                        localize { type = 'variable', key = 'deck_preview_wheel_plural', vars = { wheel_flipped } } or
                                        localize { type = 'variable', key = 'deck_preview_wheel_singular', vars = { wheel_flipped } }),
                                    colour = G.C.WHITE,
                                    scale = 0.3
                                }
                            },
                        }
                    } or nil,
                }
            }
        }
    }
    return t
end

local run_setup_option_ref = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(type)
    local t = run_setup_option_ref(type)
    t.nodes[1].nodes[5] = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cm", minw = 2.4 },
                nodes = {
                    type == 'New Run' and
                    create_toggle{ col = true, label = 'Six Suits', label_scale = 0.25, w = 0, scale = 0.7, ref_table = G, ref_value = 'six_suits' } or
                    nil
                }
            }
        }
    }
    return t
end
Game.start_run_ref = Game.start_run
function Game:start_run(args)
    if (not args.challenge or not args.challenge.deck) and (not G.six_suits) then
        args.challenge = args.challenge or {}
        args.challenge.deck = {
            no_suits = { R = true, M = true }
        }
    elseif not G.six_suits then
        args.challenge.deck.no_suits = { R = true, M = true }
    end
    self:start_run_ref(args)
end
----------------------------------------------
------------MOD CODE END---------------------
