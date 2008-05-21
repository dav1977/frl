#include "frl_platform.h"

#if( FRL_PLATFORM == FRL_PLATFORM_WIN32 )

#include "lock/frl_mutex_fn.h"
#include "frl_exception.h"

namespace frl
{
namespace lock
{
void mutexInit( MutexDescriptor &mutex )
{
	::InitializeCriticalSection( &mutex );
}

void mutexDestroy( MutexDescriptor &mutex )
{
	::DeleteCriticalSection( &mutex );
}

void mutexLock( MutexDescriptor &mutex )
{
	::EnterCriticalSection( &mutex );
}

void mutexUnlock( MutexDescriptor &mutex )
{
	::LeaveCriticalSection( &mutex );	
}

Bool mutexTryLock( MutexDescriptor &mutex )
{
	FRL_EXCEPT_GUARD_EX( FRL_FUNCTION_NAME );
	#if(_WIN32_WINNT >= 0x0400)
		return TryEnterCriticalSection( &mutex ) != 0;
	#else
		FRL_THROW( FRL_STR( "function TryEnterCriticalSection(...) not supported." ) );
	#endif
}
} // namespace lock
} // FatRat Library

#endif // FRL_PLATFORM_WIN32
