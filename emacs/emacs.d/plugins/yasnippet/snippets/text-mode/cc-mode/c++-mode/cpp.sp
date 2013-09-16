#name : sp class define
# --
#include "${2:`(file-name-base buffer-file-name)`}.h"

BEGIN_SP_NAMESPACE($1);
SP_BASIC_LOG_SETUP($1, ${3:`(file-name-delemited-to-camel-case buffer-file-name)`});

$3::$3() {
}

$3::~$3() {
}

END_SP_NAMESPACE($1);
