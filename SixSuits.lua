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
    local sprite_blinds = SMODS.Sprite:new('six_suit_Blinds', six_suit_mod.path, 'BlindChips.png', 34, 34,
        'animation_atli', 21)
    sprite_cards_1:register()
    sprite_cards_2:register()
    sprite_ui_1:register()
    sprite_ui_2:register()
    sprite_tarot:register()
    sprite_joker:register()
    sprite_blinds:register()
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

    local c_gj_273_c = SMODS.Planet:new('GJ 273 c', 'gj_273_c', { hand_type = 'Spectrum' }, { x = 0, y = 0 }, nil, 3, 1,
        nil, 1, true, false, 'six_suit_Tarot')
    local c_trappist = SMODS.Planet:new('Trappist', 'trappist', { hand_type = 'Straight Spectrum' }, { x = 1, y = 0 },
        nil, 3, 1, nil, 1, true, false, 'six_suit_Tarot')
    local c_kepler = SMODS.Planet:new('Kepler', 'kepler', { hand_type = 'Spectrum House', softlock = true },
        { x = 2, y = 0 }, nil, 3, 1,
        nil, 1, true, false, 'six_suit_Tarot')
    local c_proxima = SMODS.Planet:new('Proxima', 'proxima', { hand_type = 'Spectrum Five', softlock = true },
        { x = 3, y = 0 }, nil, 3, 1, nil, 1, true, false, 'six_suit_Tarot')
    c_gj_273_c:register()
    c_trappist:register()
    c_kepler:register()
    c_proxima:register()

    local tarot_loc_text = {
        [1] = 'Converts up to',
        [2] = '{C:attention}#1#{} selected cards',
        [3] = 'to {V:1}#2#{}',
    }
    local c_inv_star = SMODS.Tarot:new('The Star?', 'inv_star', { suit_conv = 'Stars', max_highlighted = 3 },
        { x = 2, y = 1 },
        { name = 'The Star?', text = tarot_loc_text }, 3, 1, 'Suit Conversion', true, false, 'six_suit_Tarot')
    local c_inv_moon = SMODS.Tarot:new('The Moon?', 'inv_moon', { suit_conv = 'Moons', max_highlighted = 3 },
        { x = 1, y = 1 },
        { name = 'The Moon?', text = tarot_loc_text }, 3, 1, 'Suit Conversion', true, false, 'six_suit_Tarot')
    c_inv_star:register()
    c_inv_moon:register()

    function SMODS.Tarots.c_inv_star.loc_def(_c)
        return { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }
    end

    function SMODS.Tarots.c_inv_moon.loc_def(_c)
        return { _c.config.max_highlighted, localize(_c.config.suit_conv, 'suits_plural'), colours = { G.C.SUITS[_c.config.suit_conv] } }
    end

    local c_inv_fool = SMODS.Spectral:new('The Fool?', 'inv_fool', {}, { x = 9, y = 2 }, {
        name = 'The Fool?',
        text = {
            [1] = 'Creates the last',
            [2] = '{C:spectral}Spectral{} card',
            [3] = 'used during this run',
            [4] = '{s:0.8,C:spectral}The Fool?{s:0.8} excluded'
        }
    }, 4, true, false, 'six_suit_Tarot')
    c_inv_fool:register()

    local set_c_usage_ref = set_consumeable_usage
    function set_consumeable_usage(card)
        if card.config.center_key and card.ability.consumeable and card.config.center.set == 'Spectral' then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            G.GAME.last_spectral = card.config.center_key
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        return set_c_usage_ref(card)
    end

    function SMODS.Spectrals.c_inv_fool.use(card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, G.GAME.last_spectral,
                        'inv_fool')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    used_tarot:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end

    function SMODS.Spectrals.c_inv_fool.can_use(card)
        if (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables)
            and G.GAME.last_spectral and G.GAME.last_spectral ~= 'c_inv_fool' then
            return true
        end
    end

    function SMODS.Spectrals.c_inv_fool.loc_def(card, info_queue)
        local fool_c = G.GAME.last_spectral and G.P_CENTERS[G.GAME.last_spectral] or nil
        local last_spectral = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or
            localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool?') and G.C.RED or G.C.GREEN
        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_spectral .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }
        if not (not fool_c or fool_c.name == 'The Fool?') then
            info_queue[#info_queue + 1] = fool_c
        end
        return { last_spectral }, main_end
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
    local j_clan = SMODS.Joker:new('The Clan', 'clan', { Xmult = 2, type = 'Spectrum' },
        { x = 0, y = 1 }, {
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
    function SMODS.Jokers.j_envious_joker.loc_def(card)
        return { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
    end

    function SMODS.Jokers.j_slothful_joker.loc_def(card)
        return { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
    end

    function SMODS.Jokers.j_star_ruby.loc_def(card)
        return { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
    end

    function SMODS.Jokers.j_rainbow_moonstone.loc_def(card)
        return { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
    end

    function SMODS.Jokers.j_clan.loc_def(card)
        return { card.ability.x_mult, localize(card.ability.type, 'poker_hands') }
    end

    function SMODS.Jokers.j_manic_joker.loc_def(card)
        return { card.ability.t_mult, localize(card.ability.type, 'poker_hands') }
    end

    function SMODS.Jokers.j_wicked_joker.loc_def(card)
        return { card.ability.t_chips, localize(card.ability.type, 'poker_hands') }
    end

    function SMODS.Jokers.j_star_ruby.calculate(card, context)
        if context.individual and
            context.cardarea == G.play and
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
        if context.before and (context.cardarea == G.jokers) then
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

    local bl_eclipse = SMODS.Blind:new('The Eclipse', 'eclipse', {
            name = 'The Eclipse',
            text = {
                [1] = 'All Moon cards',
                [2] = 'are debuffed'
            }
        }, 5, 2, {}, { suit = 'Moons' }, { x = 0, y = 0 }, { min = 1, max = 10 }, G.C.SUITS['Moons'], false,
        'six_suit_Blinds')
    local bl_void = SMODS.Blind:new('The Void', 'void', {
            name = 'The Void',
            text = {
                [1] = 'All Star cards',
                [2] = 'are debuffed'
            }
        }, 5, 2, {}, { suit = 'Stars' }, { x = 0, y = 1 }, { min = 1, max = 10 }, G.C.SUITS['Stars'], false,
        'six_suit_Blinds')
    bl_eclipse:register()
    bl_void:register()
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
end

----------------------------------------------
------------MOD CODE END---------------------
