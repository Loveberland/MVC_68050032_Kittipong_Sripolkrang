#ifndef BALLOT_H
#define BALLOT_H

#include <string>
#include <vector>

class Ballot {
	private:
		std::string id;
		std::string voter_id;
		std::vector<std::string> ranking;

	public:
		Ballot();
		~Ballot();
};

#endif
