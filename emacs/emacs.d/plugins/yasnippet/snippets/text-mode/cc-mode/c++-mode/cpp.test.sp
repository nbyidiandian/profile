#name : sp cppunit class define
# --
#include <cppunit/TestAssert.h>
#include <sp/${1:`(file-name-nondirectory
                            (directory-file-name
                             (file-name-directory
                              (directory-file-name
                               default-directory))))`}/test/${2:`(file-name-base
                                                                  buffer-file-name)`}.h>

using namespace std;

BEGIN_SP_NAMESPACE($1);
SP_BASIC_LOG_SETUP($1, ${3:`(file-name-delemited-to-camel-case buffer-file-name)`});

CPPUNIT_TEST_SUITE_REGISTRATION($3);

$3::$3() {
}

$3::~$3() {
}

void $3::setUp() { 
    SP_LOG(DEBUG, "setUp!");
}

void $3::tearDown() { 
    SP_LOG(DEBUG, "tearDown!");
}

END_SP_NAMESPACE($1);
