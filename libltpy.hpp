#include <lttoolbox/fst_processor.h>

class Analyser {
	public:
		Analyser(const std::string & directoryName) throw(exception);
		wstring analyse(wstring const &word);
	private:
		FSTProcessor fst;
};
