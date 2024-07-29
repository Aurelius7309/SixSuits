return {
	["misc"] = {
		["dictionary"] = {
			["k_exoplanet"] = "Exoplanet",
			["k_glass"] = "Glass!",
		},
		["suits_plural"] = {
			["six_Moons"] = "Moons",
			["six_Stars"] = "Stars",
		},
		["poker_hands"] = {
			["six_Spectrum House"] = "Spectrum House",
			["six_Straight Spectrum"] = "Straight Spectrum",
			["six_Spectrum"] = "Spectrum",
			["six_Straight Spectrum_2"] = "Royal Spectrum",
			["six_Spectrum Five"] = "Spectrum Five",
		},
		["poker_hand_descriptions"] = {
			["h_six_Spectrum Five"] = {
				"5 cards with the same rank,",
				"each with a different suit",
			},
			["h_six_Spectrum"] = {
				"5 cards with different suits",
			},
			["h_six_Straight Spectrum"] = {
				"5 cards in a row (consecutive ranks) with",
				"each card having a different suit",
			},
			["h_six_Spectrum House"] = {
				"A Three of a Kind and a Pair with",
				"each card having a different suit",
			},
		},
		["suits_singular"] = {
			["six_Moons"] = "Moon",
			["six_Stars"] = "Star",
		},
	},
	["descriptions"] = {
		["Blind"] = {
			["bl_six_void"] = {
				["name"] = "The Void",
				["text"] = {
					"All Moon cards",
					"are debuffed",
				},
			},
			["bl_six_eclipse"] = {
				["name"] = "The Eclipse",
				["text"] = {
					"All Star cards",
					"are debuffed",
				},
			},
		},
		["Tarot"] = {
			["c_six_star_q"] = {
				["name"] = "The Star?",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			["c_six_moon_q"] = {
				["name"] = "The Moon?",
				["text"] = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
		},
		["Planet"] = {
			["c_six_gj_273_c"] = {
				["name"] = "GJ 273 c",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				},
			},
			["c_six_trappist"] = {
				["name"] = "Trappist",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				},
			},
			["c_six_proxima"] = {
				["name"] = "Proxima",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				},
			},
			["c_six_kepler"] = {
				["name"] = "Kepler",
				["text"] = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				},
			},
		},
		["Joker"] = {
			["j_six_moonstone"] = {
				["name"] = "Rainbow Moonstone",
				["text"] = {
					"{C:green}#1# in #2#{} chance for",
					"played cards with {C:moons}Moon{} suit",
					"to become {C:attention}Glass{} Cards",
				},
			},
			["j_six_clan"] = {
				["name"] = "The Clan",
				["text"] = {
					"{X:mult,C:white} X#1# {} Mult if played",
					"hand contains",
					"a {C:attention}#2#",
				},
			},
			["j_six_star_ruby"] = {
				["name"] = "Star Ruby",
				["text"] = {
					"{C:green}#1# in #2#{} chance for",
					"played cards with {C:stars}Star{} suit",
					"to create a random {C:spectral}Spectral{}",
					"card when scored",
				},
			},
			["j_six_slothful_joker"] = {
				["name"] = "Slothful Joker",
				["text"] = {
					"Played cards with",
					"{C:moons}#2#{} suit give",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
			["j_six_manic_joker"] = {
				["name"] = "Manic Joker",
				["text"] = {
					"{C:red}+#1#{} Mult if played",
					"hand contains",
					"a {C:attention}#2#",
				},
			},
			["j_six_wicked_joker"] = {
				["name"] = "Wicked Joker",
				["text"] = {
					"{C:chips}+#1#{} Chips if played",
					"hand contains",
					"a {C:attention}#2#",
				},
			},
			["j_six_envious_joker"] = {
				["name"] = "Envious Joker",
				["text"] = {
					"Played cards with",
					"{C:stars}#2#{} suit give",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
		},
		["Spectral"] = {
			["c_six_fool_q"] = {
				["name"] = "The Fool?",
				["text"] = {
					"Creates the last",
					"{C:spectral}Spectral{} card",
					"used during this run",
					"{s:0.8,C:spectral}The Fool?{s:0.8} excluded",
				},
			},
		},
	},
}