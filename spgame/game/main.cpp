#include <tbwsp.hpp>
#include <arena.hpp>

int main(int argc, char *argv[]) {
    EngineInstance *instance = Arena::NewInstance(WIDTH, HEIGHT, TITLE);
    instance->LoadTextures("gameroot/textures/textures.rmap");
    instance->LoadLevel("gameroot/levels/testing.arena");
    instance->GameLoop();
    return 0;
}