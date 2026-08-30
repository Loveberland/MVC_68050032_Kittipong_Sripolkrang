#ifndef ELECTION_H
#define ELECTION_H

#include <string>
#include <vector>

class Election {
	private:
		std::string id;
		std::string title;
		bool status;
		std::vector<int> ranking_point;
		int duplicate_pattern_threshold;

	public:
		Election();
		~Election();
};

#endif
