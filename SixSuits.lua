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
    local sprite_tarot = SMODS.Sprite:new('Tarot', six_suit_mod.path, 'Tarots.png', 71, 95, 'asset_atli')
    sprite_cards_1:register()
    sprite_cards_2:register()
    sprite_ui_1:register()
    sprite_ui_2:register()
    sprite_tarot:register()
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
    G.localization.misc['poker_hands']['Spectrum'] = 'Spectrum'
    G.localization.misc['poker_hands']['Straight Spectrum'] = 'Straight Spectrum'
    G.localization.misc['poker_hands']['Royal Spectrum'] = 'Royal Spectrum'
    G.localization.misc['poker_hands']['Spectrum House'] = 'Spectrum House'
    G.localization.misc['poker_hands']['Spectrum Five'] = 'Spectrum Five'
    G.localization.misc['poker_hand_descriptions']['Spectrum'] = {
        [1] = '5 cards, each with a different suit'
    }
    G.localization.misc['poker_hand_descriptions']['Straight Spectrum'] = {
        [1] = '5 cards in a row (consecutive ranks) with',
        [2] = 'each card having a different suit'
    }
    G.localization.misc['poker_hand_descriptions']['Royal Spectrum'] = {
        [1] = '5 cards in a row (consecutive ranks) with',
        [2] = 'each card having a different suit'
    }
    G.localization.misc['poker_hand_descriptions']['Spectrum House'] = {
        [1] = 'A Three of a Kind and a Pair with',
        [2] = 'each card having a different suit'
    }
    G.localization.misc['poker_hand_descriptions']['Spectrum Five'] = {
        [1] = '5 cards with the same rank,',
        [2] = 'each with a different suit'
    }
    G.six_suits = false

    --* add hands to handlist
    local ii = {}
    for i, v in ipairs(G.handlist) do
        local hand_to_add = (v == 'Flush House') and 'Spectrum Five' or (v == 'Straight Flush') and 'Spectrum House' or
            (v == 'Four of a Kind') and 'Straight Spectrum' or (v == 'Two Pair') and 'Spectrum' or nil
        if hand_to_add then
            ii[hand_to_add] = i
        end
    end
    local j = 0
    for hand, i in pairs(ii) do
        table.insert(G.handlist, i + j, hand)
        j = j + 1
    end

    for k, v in pairs(G.CHALLENGES) do
        v = v or {}
        v.deck = v.deck or {}
        v.deck.yes_suits = v.deck.yes_suits or {}
        v.deck.yes_suits.H = true
        v.deck.yes_suits.D = true
        v.deck.yes_suits.S = true
        v.deck.yes_suits.C = true
    end
    local new_cards = {
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
    for k, v in pairs(new_cards) do
        if not G.P_CARDS[k] then
            G.P_CARDS[k] = v
        end
    end

    -- ensure the original suits are first in the list
    G.SUITS = G.SUITS or { "Hearts", "Diamonds", "Clubs", "Spades" }
    local _suits = { "Stars", "Moons" }
    for _, v in ipairs(_suits) do
        table.insert(G.SUITS, v)
    end
    G.SUIT_TABLE = G.SUIT_TABLE or {}
    G.SUIT_TABLE["Hearts"] = "H"
    G.SUIT_TABLE["Spades"] = "S"
    G.SUIT_TABLE["Diamonds"] = "D"
    G.SUIT_TABLE["Clubs"] = "C"
    G.SUIT_TABLE["Stars"] = "R"
    G.SUIT_TABLE["Moons"] = "M"

    G.tally_sprites = G.tally_sprites or {}
    G.tally_sprites["Hearts"] = { x = 0, y = 1 }
    G.tally_sprites["Diamonds"] = { x = 1, y = 1 }
    G.tally_sprites["Clubs"] = { x = 2, y = 1 }
    G.tally_sprites["Spades"] = { x = 3, y = 1 }
    G.tally_sprites["Stars"] = { x = 4, y = 1 }
    G.tally_sprites["Moons"] = { x = 5, y = 1 }

    local planets = {
        c_gj_273_c = {
            order = 13,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'GJ 273 c',
            pos = { x = 0, y = 6 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum' }
        },
        c_trappist = {
            order = 14,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Trappist',
            pos = { x = 1, y = 6 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Straight Spectrum' }
        },
        c_kepler = {
            order = 15,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Kepler',
            pos = { x = 2, y = 6 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum House', softlock = true }
        },
        c_proxima = {
            order = 16,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Proxima',
            pos = { x = 3, y = 6 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum Five', softlock = true }
        }
    }
    local tarots = {
        c_inv_star = { order = 23, discovered = false, cost = 3, consumeable = true, name = "The Star", pos = { x = 2, y = 7 }, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = { suit_conv = 'Stars', max_highlighted = 3 } },
        c_inv_moon = { order = 24, discovered = false, cost = 3, consumeable = true, name = "The Moon", pos = { x = 1, y = 7 }, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = { suit_conv = 'Moons', max_highlighted = 3 } },
    }
    local planet_loc_text = {
        [1] = '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
        [2] = '{C:attention}#2#',
        [3] = '{C:mult}+#3#{} Mult and',
        [4] = '{C:chips}+#4#{} chips',
    }
    local planet_loc = {}
    local tarot_loc = {
        c_inv_star = {
            name = "The Star",
            text = {
                [1] = 'Converts up to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'to {V:1}#2#{}',
            }
        },
        c_inv_moon = {
            name = "The Moon",
            text = {
                [1] = 'Converts up to',
                [2] = '{C:attention}#1#{} selected cards',
                [3] = 'to {V:1}#2#{}',
            }
        }
    }
    for k, v in pairs(planets) do
        v.key = k
        --v.order = table_length(G.P_CENTER_POOLS['Planet']) + 1
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Planet'], v)
        planet_loc[k] = { name = v.name, text = planet_loc_text }
        G.localization.descriptions.Planet[k] = planet_loc[k]
    end
    for k, v in pairs(tarots) do
        v.key = k
        --v.order = table_length(G.P_CENTER_POOLS['Tarot']) + 1
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Tarot'], v)
        G.localization.descriptions.Tarot[k] = tarot_loc[k]
    end

    table.sort(G.P_CENTER_POOLS['Planet'], function(a, b) return a.order < b.order end)
    table.sort(G.P_CENTER_POOLS['Tarot'], function(a, b) return a.order < b.order end)
    -------------------------------------
    local TESTHELPER_unlocks = false and not _RELEASE_MODE
    -------------------------------------
    if not love.filesystem.getInfo(G.SETTINGS.profile .. '') then
        love.filesystem.createDirectory(G.SETTINGS.profile ..
            '')
    end
    if not love.filesystem.getInfo(G.SETTINGS.profile .. '/' .. 'meta.jkr') then
        love.filesystem.append(
            G.SETTINGS.profile .. '/' .. 'meta.jkr', 'return {}')
    end

    convert_save_to_meta()

    local meta = STR_UNPACK(get_compressed(G.SETTINGS.profile .. '/' .. 'meta.jkr') or 'return {}')
    meta.unlocked = meta.unlocked or {}
    meta.discovered = meta.discovered or {}
    meta.alerted = meta.alerted or {}

    for k, v in pairs(G.P_CENTERS) do
        if not v.wip and not v.demo then
            if TESTHELPER_unlocks then
                v.unlocked = true; v.discovered = true; v.alerted = true
            end --REMOVE THIS
            if not v.unlocked and (string.find(k, '^j_') or string.find(k, '^b_') or string.find(k, '^v_')) and meta.unlocked[k] then
                v.unlocked = true
            end
            if not v.unlocked and (string.find(k, '^j_') or string.find(k, '^b_') or string.find(k, '^v_')) then
                G.P_LOCKED[#G.P_LOCKED + 1] =
                    v
            end
            if not v.discovered and (string.find(k, '^j_') or string.find(k, '^b_') or string.find(k, '^e_') or string.find(k, '^c_') or string.find(k, '^p_') or string.find(k, '^v_')) and meta.discovered[k] then
                v.discovered = true
            end
            if v.discovered and meta.alerted[k] or v.set == 'Back' or v.start_alerted then
                v.alerted = true
            elseif v.discovered then
                v.alerted = false
            end
        end
    end

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
        local new_code = G.SUIT_TABLE[new_suit] .. "_"
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

    Game.init_game_object_six_suit_ref = Game.init_game_object
    function Game:init_game_object()
        local t = self.init_game_object_six_suit_ref()
        t.hands['Spectrum Five'] = { visible = false, order = t.hands['Flush House'].order + 0.1, mult = 14, chips = 120, s_mult = 14, s_chips = 120, level = 1, l_mult = 3, l_chips = 40, played = 0, played_this_round = 0, example = { { 'S_A', true }, { 'H_A', true }, { 'C_A', true }, { 'S_A', true }, { 'R_A', true } } }
        t.hands['Spectrum House'] = { visible = false, order = t.hands['Straight Flush'].order + 0.1, mult = 7, chips = 80, s_mult = 7, s_chips = 80, level = 1, l_mult = 3, l_chips = 35, played = 0, played_this_round = 0, example = { { 'D_7', true }, { 'H_7', true }, { 'M_7', true }, { 'R_4', true }, { 'C_4', true } } }
        t.hands['Straight Spectrum'] = { visible = true, order = t.hands['Four of a Kind'].order + 0.1, mult = 6, chips = 60, s_mult = 6, s_chips = 60, level = 1, l_mult = 2, l_chips = 35, played = 0, played_this_round = 0, example = { { 'S_Q', true }, { 'M_J', true }, { 'C_T', true }, { 'R_9', true }, { 'H_8', true } } }
        t.hands['Spectrum'] = { visible = true, order = t.hands['Two Pair'].order + 0.1, mult = 2, chips = 20, s_mult = 2, s_chips = 20, level = 1, l_mult = 1, l_chips = 20, played = 0, played_this_round = 0, example = { { 'H_2', true }, { 'D_5', true }, { 'S_8', true }, { 'C_T', true }, { 'R_A', true } } }
        return t
    end

    function get_spectrum(hand)
        local suits = {}
        for _, v in ipairs(G.SUITS) do
            suits[v] = 0
        end
        if #hand < 5 or #hand > 5 then return {} end
        for i = 1, #hand do
            if hand[i].ability.name ~= 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        for i = 1, #hand do
            if hand[i].ability.name == 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        local num_suits = 0
        for _, v in pairs(suits) do
            if v > 0 then num_suits = num_suits + 1 end
        end
        return (num_suits >= 5) and { hand } or {}
    end

    local evaluate_poker_hand_six_suit_ref = evaluate_poker_hand
    function evaluate_poker_hand(hand)
        local results = evaluate_poker_hand_six_suit_ref(hand)
        results['Spectrum'] = {}
        results['Straight Spectrum'] = {}
        results['Spectrum House'] = {}
        results['Spectrum Five'] = {}
        local s = get_spectrum(hand)
        if next(s) then
            results['Spectrum'] = s
            results.top = s
            if next(get_straight(hand)) then
                results['Straight Spectrum'] = s
            end
            if next(get_X_same(3, hand)) and next(get_X_same(2, hand)) then
                results['Spectrum House'] = s
            end
            if next(get_X_same(5, hand)) then
                results['Spectrum Five'] = s
            end
        end
        return results
    end

    --! DO NOT MODIFY | add hands to G.handlist and G.GAME.hands instead
    --* I tried to turn this into a hook, but I would end up needing to re-evaluate the result anyways
    function G.FUNCS.get_poker_hand_info(_cards)
        local poker_hands = evaluate_poker_hand(_cards)
        local scoring_hand = {}
        local text, disp_text, loc_disp_text = 'NULL', 'NULL', 'NULL'
        for _, v in ipairs(G.handlist) do
            if next(poker_hands[v]) then
                text = v
                scoring_hand = poker_hands[v][1]
                break
            end
        end
        disp_text = text
        if text == 'Straight Flush' then
            local min = 10
            for j = 1, #scoring_hand do
                if scoring_hand[j]:get_id() < min then min = scoring_hand[j]:get_id() end
            end
            if min >= 10 then
                disp_text = 'Royal Flush'
            end
        end
        if text == 'Straight Spectrum' then
            local min = 10
            for j = 1, #scoring_hand do
                if scoring_hand[j]:get_id() < min then min = scoring_hand[j]:get_id() end
            end
            if min >= 10 then
                disp_text = 'Royal Spectrum'
            end
        end
        loc_disp_text = localize(disp_text, 'poker_hands')
        return text, loc_disp_text, poker_hands, scoring_hand, disp_text
    end

    --! DO NOT MODIFY | handles hands added to G.handlist
    function create_UIBox_current_hands(simple)
        local hands = {}
        for _, v in ipairs(G.handlist) do
            hands[#hands + 1] = create_UIBox_current_hand_row(v, simple)
        end
        local t = {
            n = G.UIT.ROOT,
            config = { align = "cm", minw = 3, padding = 0.1, r = 0.1, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.04 },
                    nodes =
                        hands
                },
            }
        }
        return t
    end

    --! not extensible, original function does not paginate
    G.FUNCS.your_collection_planet_page = function(args)
        if not args or not args.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
                local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
                c:remove()
                c = nil
            end
        end

        for j = 1, #G.your_collection do
            for i = 1, 4 do
                local center = G.P_CENTER_POOLS["Planet"]
                    [i + (j - 1) * (4) + (8 * (args.cycle_config.current_option - 1))]
                if not center then break end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
                    G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
                card:start_materialize(nil, i > 1 or j > 1)
                G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    function create_UIBox_your_collection_planets()
        local deck_tables = {}

        G.your_collection = {}
        for j = 1, 2 do
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                4 * G.CARD_W,
                1 * G.CARD_H,
                { card_limit = 4, type = 'title', highlight_limit = 0, collection = true })
            table.insert(deck_tables,
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0, no_fill = true },
                    nodes = {
                        { n = G.UIT.O, config = { object = G.your_collection[j] } }
                    }
                }
            )
        end

        local planet_options = {}
        for i = 1, math.ceil(#G.P_CENTER_POOLS.Planet / 8) do
            table.insert(planet_options,
                localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#G.P_CENTER_POOLS.Planet / 8)))
        end

        for j = 1, #G.your_collection do
            for i = 1, 4 do
                local center = G.P_CENTER_POOLS["Planet"][i + (j - 1) * (4)]
                if not center then break end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
                    G.CARD_W, G.CARD_H, nil, center)
                card:start_materialize(nil, i > 1 or j > 1)
                G.your_collection[j]:emplace(card)
            end
        end

        INIT_COLLECTION_CARD_ALERTS()

        local t = create_UIBox_generic_options({
            back_func = 'your_collection',
            contents = {
                { n = G.UIT.R, config = { align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
                {
                    n = G.UIT.R,
                    config = { align = "cm" },
                    nodes = {
                        create_option_cycle({
                            options = planet_options,
                            w = 4.5,
                            cycle_shoulders = true,
                            opt_callback =
                            'your_collection_planet_page',
                            focus_args = { snap_to = true, nav = 'wide' },
                            current_option = 1,
                            colour =
                                G.C.RED,
                            no_pips = true
                        })
                    }
                }
            }
        })
        return t
    end

    -- only change is to allow for incomplete pages
    function create_UIBox_your_collection_tarots()
        local deck_tables = {}

        G.your_collection = {}
        for j = 1, 2 do
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                (4.25 + j) * G.CARD_W,
                1 * G.CARD_H,
                { card_limit = 4 + j, type = 'title', highlight_limit = 0, collection = true })
            table.insert(deck_tables,
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0, no_fill = true },
                    nodes = {
                        { n = G.UIT.O, config = { object = G.your_collection[j] } }
                    }
                }
            )
        end

        local tarot_options = {}
        for i = 1, math.ceil(#G.P_CENTER_POOLS.Tarot / 11) do
            table.insert(tarot_options,
                localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#G.P_CENTER_POOLS.Tarot / 11)))
        end

        for j = 1, #G.your_collection do
            for i = 1, 4 + j do
                local center = G.P_CENTER_POOLS["Tarot"][i + (j - 1) * (5)]
                if not center then break end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
                    G.CARD_W, G.CARD_H, nil, center)
                card:start_materialize(nil, i > 1 or j > 1)
                G.your_collection[j]:emplace(card)
            end
        end

        INIT_COLLECTION_CARD_ALERTS()

        local t = create_UIBox_generic_options({
            back_func = 'your_collection',
            contents = {
                { n = G.UIT.R, config = { align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
                {
                    n = G.UIT.R,
                    config = { align = "cm" },
                    nodes = {
                        create_option_cycle({
                            options = tarot_options,
                            w = 4.5,
                            cycle_shoulders = true,
                            opt_callback =
                            'your_collection_tarot_page',
                            focus_args = { snap_to = true, nav = 'wide' },
                            current_option = 1,
                            colour =
                                G.C.RED,
                            no_pips = true
                        })
                    }
                }
            }
        })
        return t
    end
end

--! DO NOT MODIFY | recognizes suits from G.SUITS
function get_flush(hand)
    local ret = {}
    local four_fingers = next(find_joker('Four Fingers'))
    local suits = G.SUITS
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

--! DO NOT MODIFY | recognizes suits from G.SUITS
function G.UIDEF.view_deck(unplayed_only)
    local deck_tables = {}
    remove_nils(G.playing_cards)
    G.VIEWING_DECK = true
    table.sort(G.playing_cards, function(a, b) return a:get_nominal('suit') > b:get_nominal('suit') end)
    local SUITS = {}
    for _, v in ipairs(G.SUITS) do
        SUITS[v] = {}
    end
    for k, v in ipairs(G.playing_cards) do
        table.insert(SUITS[v.base.suit], v)
    end
    local num_suits = 0
    for j = 1, #G.SUITS do
        if SUITS[G.SUITS[j]][1] then num_suits = num_suits + 1 end
    end
    for j = 1, #G.SUITS do
        if SUITS[G.SUITS[j]][1] then
            local view_deck = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                6.5 * G.CARD_W,
                ((num_suits > 8) and 0.2 or (num_suits > 4) and (1 - 0.1 * num_suits) or 0.6) * G.CARD_H,
                {
                    card_limit = #SUITS[G.SUITS[j]],
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

            for i = 1, #SUITS[G.SUITS[j]] do
                if SUITS[G.SUITS[j]][i] then
                    local greyed, _scale = nil, 0.7
                    if unplayed_only and not ((SUITS[G.SUITS[j]][i].area and SUITS[G.SUITS[j]][i].area == G.deck) or SUITS[G.SUITS[j]][i].ability.wheel_flipped) then
                        greyed = true
                    end
                    local copy = copy_card(SUITS[G.SUITS[j]][i], nil, _scale)
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

    local suit_tallies = {}
    local mod_suit_tallies = {}
    for _, v in ipairs(G.SUITS) do
        suit_tallies[v] = 0
        mod_suit_tallies[v] = 0
    end
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

    for _, v in ipairs(G.playing_cards) do
        if v.ability.name ~= 'Stone Card' and (not unplayed_only or ((v.area and v.area == G.deck) or v.ability.wheel_flipped)) then
            if v.ability.wheel_flipped and unplayed_only then wheel_flipped = wheel_flipped + 1 end
            --For the suits
            suit_tallies[v.base.suit] = (suit_tallies[v.base.suit] or 0) + 1
            for kk, vv in pairs(mod_suit_tallies) do
                mod_suit_tallies[kk] = (vv or 0) + (v:is_suit(kk) and 1 or 0)
            end

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

    local modded = (face_tally ~= mod_face_tally)
    for kk, vv in pairs(mod_suit_tallies) do
        if vv ~= suit_tallies[kk] then modded = true end
    end

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

    local tally_ui = {
        -- base cards
        {
            n = G.UIT.R,
            config = { align = "cm", minh = 0.05, padding = 0.07 },
            nodes = {
                { n = G.UIT.O, config = { object = DynaText({ string = { { string = localize('k_base_cards'), colour = G.C.RED }, modded and { string = localize('k_effective'), colour = G.C.BLUE } or nil }, colours = { G.C.RED }, silent = true, scale = 0.4, pop_in_rate = 10, pop_delay = 4 }) } }
            }
        },
        -- aces, faces and numbered cards
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
    }
    -- add suit tallies
    for i = 1, #G.SUITS, 2 do
        local n = {
            n = G.UIT.R,
            config = { align = "cm", minh = 0.05, padding = 0.1 },
            nodes = {
                tally_sprite(G.tally_sprites[G.SUITS[i]],
                    { { string = '' .. suit_tallies[G.SUITS[i]], colour = flip_col }, { string = '' .. mod_suit_tallies[G.SUITS[i]], colour = G.C.BLUE } },
                    { localize(G.SUITS[i], 'suits_plural') }),
                G.SUITS[i + 1] and tally_sprite(G.tally_sprites[G.SUITS[i + 1]],
                    { { string = '' .. suit_tallies[G.SUITS[i + 1]], colour = flip_col }, { string = '' .. mod_suit_tallies[G.SUITS[i + 1]], colour = G.C.BLUE } },
                    { localize(G.SUITS[i + 1], 'suits_plural') }) or nil,
            }
        }
        table.insert(tally_ui, n)
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
                                        nodes = tally_ui
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

--! DO NOT MODIFY | recognizes suits from G.SUITS
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
    local SUITS = {}
    for _, v in ipairs(G.SUITS) do
        SUITS[v] = {}
    end

    for k, v in pairs(SUITS) do
        for i = 1, 14 do
            SUITS[k][#SUITS[k] + 1] = {}
        end
    end

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

    for j = 1, #G.SUITS do
        _row = {}
        _bg_col = mix_colours(G.C.SUITS[G.SUITS[j]], G.C.L_BLACK, 0.7)
        for i = 14, 2, -1 do
            local _tscale = #SUITS[G.SUITS[j]][i] > 0 and 0.3 or 0.25
            local _colour = #SUITS[G.SUITS[j]][i] > 0 and flip_col or G.C.UI.TRANSPARENT_LIGHT

            local _col = {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.05, minw = _minw + 0.098, minh = _minh },
                nodes = {
                    { n = G.UIT.T, config = { text = '' .. #SUITS[G.SUITS[j]][i], colour = _colour, scale = _tscale, shadow = true, lang = G.LANGUAGES['en-us'] } },
                }
            }
            table.insert(_row, _col)
        end
        table.insert(deck_tables,
            { n = G.UIT.R, config = { align = "cm", r = 0.1, padding = 0.04, minh = 0.4, colour = _bg_col }, nodes = _row })
    end

    for _, v in ipairs(G.SUITS) do
        local t_s = Sprite(0, 0, 0.3, 0.3, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
            G.tally_sprites[v])
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

local run_setup_option_six_suit_ref = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(type)
    local t = run_setup_option_six_suit_ref(type)
    t.nodes[1].nodes[5] = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cm", minw = 2.4 },
                nodes = {
                    type == 'New Run' and
                    create_toggle { col = true, label = 'Six Suits', label_scale = 0.25, w = 0, scale = 0.7, ref_table = G, ref_value = 'six_suits' } or
                    nil
                }
            }
        }
    }
    return t
end

Game.start_run_six_suit_ref = Game.start_run
function Game:start_run(args)
    args.challenge = args.challenge or { deck = {} }
    if not args.challenge.deck and not G.six_suits then
        args.challenge.deck.yes_suits = { H = true, D = true, C = true, S = true }
    elseif not G.six_suits then
        args.challenge.deck.yes_suits = { H = true, D = true, C = true, S = true }
    else
        args.challenge.deck.yes_suits = {}
        for _, v in ipairs(G.SUITS) do
            args.challenge.deck.yes_suits[G.SUIT_TABLE[v]] = true
        end
    end
    self:start_run_six_suit_ref(args)
end

Blind.set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    self:set_blind_ref(blind, reset, silent)
    if (self.name == "The Eye") and not reset then
        for _, v in ipairs(G.handlist) do
            self.hands[v] = false
        end
    end
end

----------------------------------------------
------------MOD CODE END---------------------
