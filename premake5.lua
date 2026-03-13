project "zstd"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

    defines { "ZSTD_STATIC_LINKING_ONLY" }

    includedirs { "vendor/zstd/lib" }

    files {
        "vendor/zstd/lib/common/**.c",
        "vendor/zstd/lib/compress/**.c",
        "vendor/zstd/lib/decompress/**.c",
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
    symbols "off"