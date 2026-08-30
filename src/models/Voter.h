#ifndef VOTER_H
#define VOTER_H

#include <string>

class Voter {
	private:
		std::string id;
		std::string name;
		bool status;

	public:
		Voter();
		~Voter();
};

#endif
