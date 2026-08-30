#include "Vote.h"

Vote::Vote() {

}

Vote::~Vote() {

}

bool Vote::init_election() {
	std::ifstream file("seed_data.json");
	if (!file.is_open()) {
		std::cerr << "Error: Failed to open seed_data.json\n";
		return false;
	}

	file >> j;

	display_candidate();
	
	return true;
}
