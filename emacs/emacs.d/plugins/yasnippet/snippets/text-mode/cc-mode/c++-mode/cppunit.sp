#name : sp cppunit declare
# --
#ifndef ${1:`(file-name-cpp-include-guard "_" buffer-file-name "_" 3)`}
#define $1

#include <cppunit/extensions/HelperMacros.h>
#include "sp_basic/common/common.h"

BEGIN_SP_NAMESPACE(${2:`(file-name-nondirectory
			                      (directory-file-name
								   (file-name-directory
									(directory-file-name default-directory))))`});

class ${3:`(file-name-delemited-to-camel-case buffer-file-name)`} : public CppUnit::TestFixture
{
	CPPUNIT_TEST_SUITE($3);
	CPPUNIT_TEST(${4:testMethod});
	CPPUNIT_TEST_SUITE_END();
public:
    $3();
    virtual ~$3();
public:
    void setUp();
    void tearDown();
    void $4();
private:
    SP_BASIC_LOG_DECLARE();
};

END_SP_NAMESPACE($2);

#endif // $1
