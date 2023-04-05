#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp"

#include "greeting.h"

TEST_CASE("Return correct greeting", "[greeting]") {
    REQUIRE(greeting("Jeff") == "Hello, Jeff");
}
