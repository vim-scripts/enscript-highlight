" Vim syntax file
" Language:	EnScript
" Maintainer:	pancake < pancake@youterm.com >
" Last Change:	2007 Jun 27
"
" Covardly copied from the cpp.vim syntax file

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" Enscript extentions
syn keyword enscriptStatement	new delete this friend using

syn keyword enscriptAccess		public protected private

syn keyword enscriptType		inline virtual explicit export bool wchar_t

" Data structures
syn keyword enscriptType		ArrayClass NodeClass NameListClass NameValueClass EmailAddressClass DateClass IPClass HashClass GUIDClass IDSEventClass String FileClass
" Accessing Case Data
syn keyword enscriptType		AcquisitionClass AssociatedVolumeClass BookmarkClass CaseClass CDCacheItemClass CRCErrorClass DeviceClass EntryClass EmailClass EmailFieldClass HistoryClass ReadErrorClass SearchHitClass SubjectClass SourceClass VolumeClass WebEntryMapClass
" Communicating with encase safe and remote servlets
syn keyword enscriptType 		BatchClass ConnectionClass DirRootClass DirectoryClass DeviceInfoClass ExecuteClass FileWipeClass HostFileClass NetworkClass SafeClass SnapshotClass RoleClass 
" Encase Global Objects
syn keyword enscriptType		AppDescriptorClass AllowedClass EncryptionKeyClass FileSignatureClass FileTypeClass GlobalDataClass ProfileClass SecurityIDClass TextStyleClass ViewerClass 
" Presenting Input Via Dialogs
syn keyword enscriptType		ArrayEditClass ButtonClass CheckBoxClass DateEditClass DialogClass EnumEditClass GroupBoxClass GUIDEditClass HashEditClass IntEditClass IPEditClass ListEditClass LongEditClass NameEditClass PathEditClass RadioButtonClass StaticTextClass StorageClass StringEditClass TreeEditClass TreeTableEditClass UintEditClass WindowClass 
" Presenting Output
syn keyword enscriptType 		BookmarkClass BookmarkFolderClass 
" Manipulating Evidence Files
syn keyword enscriptType		EvidenceFileClass LogicalEvidenceFileClass
" Reading And Writing Files
syn keyword enscriptType 		EntryFileClass FileClass LocalFileClass HostFileClass 
" Searching and Hashing
syn keyword enscriptType		KeywordClass SearchClass MemoryFileClass
" Registry Operations
syn keyword enscriptType		RegistryClass RegCommandClass RegValueClass
" Conditions
syn keyword enscriptType		ConditionClass ProgramClass TermClass 

" Language itself
syn keyword enscriptExceptions	throw try catch
syn keyword enscriptOperator		operator typeid
syn keyword enscriptOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match enscriptCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match enscriptCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword enscriptStorageClass	mutable
syn keyword enscriptStructure	class typename template namespace
syn keyword enscriptNumber		NPOS
syn keyword enscriptBoolean		true false

" The minimum and maximum operators in GNU C++
syn match enscriptMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_enscript_syntax_inits")
  if version < 508
    let did_enscript_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink enscriptAccess		enscriptStatement
  HiLink enscriptCast		enscriptStatement
  HiLink enscriptExceptions		Exception
  HiLink enscriptOperator		Operator
  HiLink enscriptStatement		Statement
  HiLink enscriptType		Type
  HiLink enscriptStorageClass	StorageClass
  HiLink enscriptStructure		Structure
  HiLink enscriptNumber		Number
  HiLink enscriptBoolean		Boolean
  delcommand HiLink
endif

let b:current_syntax = "enscript"

" vim: ts=8
