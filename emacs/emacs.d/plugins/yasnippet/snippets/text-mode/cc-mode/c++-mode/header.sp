#name : sp class define
# --
#ifndef ${1:_SP_BASIC`(file-name-cpp-include-guard buffer-file-name)`}
#define $1

namespace ${2:sp_basic}
{

class ${3:`(file-name-base buffer-file-name)`}
{
public:
    $3();
    virtual ~$3();
    $0
};

} // end of namespace $2

#endif // $1
