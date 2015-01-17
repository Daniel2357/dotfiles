# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wc++98-compat',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-std=c++11',
    '-x',
    'c++',
]


def FlagsForFile(filename, **kwargs):
    return {'flags': flags, 'do_cache': True}
