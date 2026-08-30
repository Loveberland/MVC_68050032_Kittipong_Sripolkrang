#ifndef VOTE_H
#define VOTE_H

#include <iostream>
#include <fstream>
#include <string>
#include <nlohmann/json.hpp>
#include "models/Election.h"
#include "models/Officer.h"

class Vote {
	private:
		Election election;
		Officer officer;
		nlohmann::json j;
	
	public:
		void display_candidate() {
			std::cout << "All candidates:\n";
			for (const auto &i : j["candidates"]) {
				std::cout << "ID: " << i["id"] << '\n';
				std::cout << "Name: " << i["name"] << "\n\n";
			}

			for (int i = 0; i < 20; ++i) {
				std::cout << '-';
			}

			std::cout << '\n';
		}

		Vote();
		~Vote();
		bool init_election();
};

#endif
