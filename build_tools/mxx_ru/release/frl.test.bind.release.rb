require 'mxx_ru/cpp'

MxxRu::Cpp::exe_target("frl.test.bind.release.rb")\
{
	required_prj( "frl.lib.release.rb" )
	target("test_bind")
	include_path("../../../test/bind")
	runtime_mode( MxxRu::Cpp::RUNTIME_RELEASE )
	rtl_mode( MxxRu::Cpp::RTL_STATIC )
	threading_mode( MxxRu::Cpp::THREADING_MULTI )
	obj_placement( MxxRu::Cpp::CustomSubdirObjPlacement.new( "../../../output/test/bind", "../../../output/test/bind/obj/#{mxx_runtime_mode}/1/2/3" ) )
	cpp_sources Dir.glob( "../../../test/bind/**/*.cpp" )
}
