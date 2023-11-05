workspace "Eunoia-Dev"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    project "Eunoia-Engine"
        location "Eunoia-Engine"
        kind "SharedLib"
        language "C++"

        targetdir ("Bin/"..outputdir.."/%{prj.name}")
        objdir ("Bin-Int/" ..outputdir.. "/%{prj.name}")

    files
	{
		"%{prj.name}/Src/**.h",
		"%{prj.name}/Src/**.cpp",
		"%{prj.name}/Vendor/**.h",
		"%{prj.name}/Vendor/**.cpp",
	}

    includedirs
    {
        "%{prj.name}/Libs/Vulkan/Include",
		"%{prj.name}/Src"
    }

    links 
    {
        "Eunoia-Engine/Libs/Vulkan/Libs/vulkan-1"
    }

    defines
    {
        "EU_ENGINE"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "10.0"

        defines
        {
            "EU_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
		defines "EU_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "EU_RELEASE"
		optimize "On"

    project "Sandbox"
        location "Eunoia-Engine"
        kind "ConsoleApp"
        language "C++"

        targetdir ("Bin/"..outputdir.."/%{prj.name}")
        objdir ("Bin-Int/"..outputdir.."/%{prj.name}")

        files
        {
            "%{prj.name}/Src/**.h",
		    "%{prj.name}/Src/**.cpp",
        }

        includedirs
        {
            "Eunoia-Engine/Src",
            "Eunoia-Engine/Libs/Vulkan/Include"
        }

        links 
        {
            "Eunoia-Engine"
        }

        defines 
        {
            "EU_APPLICATION"
        }

        filter "system:windows"
            cppdialect "C++17"
            staticruntime "On"
            systemversion "10.0"

		defines
		{
			"EU_PLATFORM_WINDOWS"
		}

        filter "configurations:Debug"
		    defines "EU_DEBUG"
		    symbols "On"

	    filter "configurations:Release"
		    defines "EU_RELEASE"
		    optimize "On"

