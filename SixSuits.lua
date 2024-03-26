--- STEAMODDED HEADER
--- MOD_NAME: Six Suits
--- MOD_ID: SixSuits
--- MOD_AUTHOR: [Aure, CrimsonHeart]
--- MOD_DESCRIPTION: This mod adds the Spectrum hand, for use with two new suits: Stars and Moons.

----------------------------------------------
------------MOD CODE -------------------------
function SMODS.INIT.SixSuit()
    local six_suit_mod = SMODS.findModByID('SixSuits')
    local sprite_cards_1 = SMODS.Sprite:new('six_suit_cards_1', six_suit_mod.path, '8BitDeck.png', 71, 95, 'asset_atli')
    local sprite_cards_2 = SMODS.Sprite:new('six_suit_cards_2', six_suit_mod.path, '8BitDeck_opt2.png', 71, 95,
        'asset_atli')
    local sprite_ui_1 = SMODS.Sprite:new('six_suit_ui_1', six_suit_mod.path, 'ui_assets.png', 18, 18, 'asset_atli')
    local sprite_ui_2 = SMODS.Sprite:new('six_suit_ui_2', six_suit_mod.path, 'ui_assets_opt2.png', 18, 18, 'asset_atli')
    local sprite_tarot = SMODS.Sprite:new('six_suit_Tarot', six_suit_mod.path, 'Tarots.png', 71, 95, 'asset_atli')
    local sprite_joker = SMODS.Sprite:new('six_suit_jokers', six_suit_mod.path, 'Jokers.png', 71, 95, 'asset_atli')
    sprite_cards_1:register()
    sprite_cards_2:register()
    sprite_ui_1:register()
    sprite_ui_2:register()
    sprite_tarot:register()
    sprite_joker:register()
    -- function SMODS.Card:new_suit(name, card_atlas_low_contrast, card_atlas_high_contrast, card_pos, ui_atlas_low_contrast, ui_atlas_high_contrast, ui_pos, colour_low_contrast, colour_high_contrast)
    SMODS.Card:new_suit('Moons', 'six_suit_cards_1', 'six_suit_cards_2', { y = 1 }, 'six_suit_ui_1', 'six_suit_ui_2',
        { x = 1, y = 0 }, '696076', '696076')
    SMODS.Card:new_suit('Stars', 'six_suit_cards_1', 'six_suit_cards_2', { y = 0 }, 'six_suit_ui_1', 'six_suit_ui_2',
        { x = 0, y = 0 }, 'DF509F', 'DF509F')
    --[[
    SMODS.Card:new_rank('Fake Ace', 100, 'six_suit_cards_1', 'six_suit_cards_2', { x = 12 }, {
        Hearts = { y = 0 },
        Clubs = { y = 1 },
        Diamonds = { y = 2 },
        Spades = { y = 3 },
        Stars = { y = 4 },
        Moons = { y = 5 },
    }, {
        face_nominal = 0.5,
        next = {'Ace'}
    })
    SMODS.Card.RANKS['3'].next = { '4', 'Fake Ace' }
    SMODS.Card.RANKS['7'].next = { '9', '8' }
    SMODS.Card.RANKS['7'].strength_effect = { random = true }
    SMODS.Card.RANKS['Ace'].strength_effect = { ignore = true }
    --]]
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
    G.localization.misc.dictionary['k_glass'] = 'Glass'
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
    local planet_loc_text = {
        [1] = '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
        [2] = '{C:attention}#2#',
        [3] = '{C:mult}+#3#{} Mult and',
        [4] = '{C:chips}+#4#{} chips',
    }
    local planets = {
        c_gj_273_c = {
            order = 13,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'GJ 273 c',
            pos = { x = 0, y = 0 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum' },
            atlas = 'six_suit_Tarot'
        },
        c_trappist = {
            order = 14,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Trappist',
            pos = { x = 1, y = 0 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Straight Spectrum' },
            atlas = 'six_suit_Tarot'
        },
        c_kepler = {
            order = 15,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Kepler',
            pos = { x = 2, y = 0 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum House', softlock = true },
            atlas = 'six_suit_Tarot'
        },
        c_proxima = {
            order = 16,
            discovered = false,
            cost = 3,
            consumeable = true,
            freq = 1,
            name = 'Proxima',
            pos = { x = 3, y = 0 },
            set = 'Planet',
            effect = 'Hand Upgrade',
            cost_mult = 1.0,
            config = { hand_type = 'Spectrum Five', softlock = true },
            atlas = 'six_suit_Tarot'
        }
    }
    local tarots = {
        c_inv_star = { order = 23, discovered = false, cost = 3, consumeable = true, name = "The Star", pos = { x = 2, y = 1 }, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = { suit_conv = 'Stars', max_highlighted = 3 }, atlas = 'six_suit_Tarot' },
        c_inv_moon = { order = 24, discovered = false, cost = 3, consumeable = true, name = "The Moon", pos = { x = 1, y = 1 }, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = { suit_conv = 'Moons', max_highlighted = 3 }, atlas = 'six_suit_Tarot' },
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
    function save_meta_six_suits()
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
    end

    save_meta_six_suits()

    local init_item_prototypes_ref = Game.init_item_prototypes
    function Game:init_item_prototypes()
        local P_CENTERS = self.P_CENTERS
        local P_CENTER_POOLS = self.P_CENTER_POOLS
        init_item_prototypes_ref(self)
        if P_CENTERS then self.P_CENTERS = P_CENTERS end
        if P_CENTER_POOLS then self.P_CENTER_POOLS = P_CENTER_POOLS end
        save_meta_six_suits()
    end

    local j_envious_joker = SMODS.Joker:new('Envious Joker', 'envious_joker', { extra = { s_mult = 4, suit = 'Stars' } },
        { x = 0, y = 0 }, {
            name = 'Envious Joker',
            text = {
                [1] = 'Played cards with',
                [2] = '{C:stars}#2#{} suit give',
                [3] = '{C:mult}+#1#{} Mult when scored'
            }
        }, 1, 5, true, false, true, true, 'Suit Mult', 'six_suit_jokers')
    local j_slothful_joker = SMODS.Joker:new('Slothful Joker', 'slothful_joker',
        { extra = { s_mult = 4, suit = 'Moons' } },
        { x = 1, y = 0 }, {
            name = 'Slothful Joker',
            text = {
                [1] = 'Played cards with',
                [2] = '{C:moons}#2#{} suit give',
                [3] = '{C:mult}+#1#{} Mult when scored'
            }
        }, 1, 5, true, false, true, true, 'Suit Mult', 'six_suit_jokers')
    local j_star_ruby = SMODS.Joker:new('Star Ruby', 'star_ruby', { extra = { odds = 10 } },
        { x = 2, y = 0 }, {
            name = 'Star Ruby',
            text = {
                [1] = '{C:green}#1# in #2#{} chance for',
                [2] = 'played cards with {C:stars}Star{} suit',
                [3] = 'to create a random {C:spectral}Spectral{}',
                [4] = 'card when scored'
            }
        }, 2, 7, true, false, true, true, nil, 'six_suit_jokers')
    local j_rainbow_moonstone = SMODS.Joker:new('Rainbow Moonstone', 'rainbow_moonstone', { extra = { odds = 2 } },
        { x = 3, y = 0 }, {
            name = 'Rainbow Moonstone',
            text = {
                [1] = '{C:green}#1# in #2#{} chance for',
                [2] = 'played cards with {C:moons}Moon{} suit',
                [3] = 'to become {C:attention}Glass{} Cards'
            }
        }, 2, 7, true, false, true, true, nil, 'six_suit_jokers')
    local j_clan = SMODS.Joker:new('The Clan', 'clan', {Xmult = 2, type = 'Spectrum'}, 
        {x = 0, y = 1}, {
            name = 'The Clan',
            text = {
                [1] = '{X:mult,C:white} X#1# {} Mult if played',
                [2] = 'hand contains',
                [3] = 'a {C:attention}#2#'
            }
        }, 3, 8, true, false, true, true, nil, 'six_suit_jokers')
    local j_manic_joker = SMODS.Joker:new('Manic Joker', 'manic_joker', { t_mult = 10, type = 'Spectrum' },
        { x = 1, y = 1 }, {
            name = 'Manic Joker',
            text = {
                [1] = '{C:red}+#1#{} Mult if played',
                [2] = 'hand contains',
                [3] = 'a {C:attention}#2#'
            }
        }, 1, 4, true, false, true, true, 'Type Mult', 'six_suit_jokers')
    local j_wicked_joker = SMODS.Joker:new('Wicked Joker', 'wicked_joker', { t_chips = 80, type = 'Spectrum' },
        { x = 2, y = 1 }, {
            name = 'Wicked Joker',
            text = {
                [1] = '{C:chips}+#1#{} Chips if played',
                [2] = 'hand contains',
                [3] = 'a {C:attention}#2#'
            }
        }, 1, 4, true, false, true, true, nil, 'six_suit_jokers')
    j_envious_joker:register()
    j_slothful_joker:register()
    j_star_ruby:register()
    j_rainbow_moonstone:register()
    j_clan:register()
    j_manic_joker:register()
    j_wicked_joker:register()
    function SMODS.Jokers.j_envious_joker:loc_def(card)
        if card.ability.name == 'Envious Joker' then
            return { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
        end
    end

    function SMODS.Jokers.j_slothful_joker:loc_def(card)
        if card.ability.name == 'Slothful Joker' then
            return { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
        end
    end

    function SMODS.Jokers.j_star_ruby:loc_def(card)
        if (card.ability.name == 'Star Ruby') then
            return { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
        end
    end

    function SMODS.Jokers.j_rainbow_moonstone:loc_def(card)
        if (card.ability.name == 'Rainbow Moonstone') then
            return { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
        end
    end

    function SMODS.Jokers.j_clan:loc_def(card)
        if card.ability.name == 'The Clan' then
            return { card.ability.x_mult, localize(card.ability.type, 'poker_hands') }
        end
    end

    function SMODS.Jokers.j_manic_joker:loc_def(card)
        if card.ability.name == 'Manic Joker' then
            return {card.ability.t_mult, localize(card.ability.type, 'poker_hands')}
        end
    end
    
    function SMODS.Jokers.j_wicked_joker:loc_def(card)
        if card.ability.name == 'Wicked Joker' then
            return {card.ability.t_chips, localize(card.ability.type, 'poker_hands')}
        end
    end

    function SMODS.Jokers.j_star_ruby.calculate(card, context)
        if context.individual and
            context.cardarea == G.play and
            (card.ability.name == 'Star Ruby') and
            context.other_card:is_suit('Stars') and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
            pseudorandom('starruby') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'ruby')
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                    G.GAME.consumeable_buffer = 0
                    return true
                end)
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                { message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral })
            return {}
        end
    end

    function SMODS.Jokers.j_rainbow_moonstone.calculate(card, context)
        if (card.ability.name == 'Rainbow Moonstone') and context.before and (context.cardarea == G.jokers) then
            local moons = {}
            for _, v in ipairs(context.full_hand) do
                if v:is_suit('Moons') and not (v.ability.name == 'Glass Card') and pseudorandom('moonstone') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    moons[#moons + 1] = v
                    v:set_ability(G.P_CENTERS.m_glass, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #moons > 0 then
                return {
                    message = localize('k_glass'),
                    colour = G.C.SECONDARY_SET.Enhanced,
                    card = context.blueprint_card or card
                }
            end
        end
    end

    local init_game_object_six_suit_ref = Game.init_game_object
    function Game:init_game_object()
        local t = init_game_object_six_suit_ref(self)
        t.hands['Spectrum Five'] = { visible = false, order = t.hands['Flush House'].order + 0.1, mult = 14, chips = 120, s_mult = 14, s_chips = 120, level = 1, l_mult = 3, l_chips = 40, played = 0, played_this_round = 0, example = { { 'S_A', true }, { 'H_A', true }, { 'C_A', true }, { 'S_A', true }, { 'R_A', true } } }
        t.hands['Spectrum House'] = { visible = false, order = t.hands['Straight Flush'].order + 0.1, mult = 7, chips = 80, s_mult = 7, s_chips = 80, level = 1, l_mult = 3, l_chips = 35, played = 0, played_this_round = 0, example = { { 'D_7', true }, { 'H_7', true }, { 'M_7', true }, { 'R_4', true }, { 'C_4', true } } }
        t.hands['Straight Spectrum'] = { visible = true, order = t.hands['Four of a Kind'].order + 0.1, mult = 6, chips = 60, s_mult = 6, s_chips = 60, level = 1, l_mult = 2, l_chips = 35, played = 0, played_this_round = 0, example = { { 'S_Q', true }, { 'M_J', true }, { 'C_T', true }, { 'R_9', true }, { 'H_8', true } } }
        t.hands['Spectrum'] = { visible = true, order = t.hands['Two Pair'].order + 0.1, mult = 2, chips = 20, s_mult = 2, s_chips = 20, level = 1, l_mult = 1, l_chips = 20, played = 0, played_this_round = 0, example = { { 'H_2', true }, { 'D_5', true }, { 'S_8', true }, { 'C_T', true }, { 'R_A', true } } }
        return t
    end

    function get_spectrum(hand)
        local suits = {}
        for _, v in ipairs(SMODS.Card.SUIT_LIST) do
            suits[v] = 0
        end
        if #hand < 5 or #hand > 5 then return {} end
        for i = 1, #hand do
            if hand[i].ability.name ~= 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        for i = 1, #hand do
            if hand[i].ability.name == 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
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

----------------------------------------------
------------MOD CODE END---------------------
