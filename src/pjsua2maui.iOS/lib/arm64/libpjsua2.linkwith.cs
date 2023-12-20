// AVISO: este recurso está obsoleto. Em vez disso, use a pasta "Referências nativas".
// Clique com o botão direito do mouse na pasta "Native References", selecione "Add Native Reference",
// e, em seguida, selecione a biblioteca ou estrutura estática que deseja vincular.
//
// Depois de adicionar sua biblioteca ou estrutura estática, clique com o botão direito do mouse na biblioteca ou
// framework e selecione "Propriedades" para alterar os valores LinkWith.

using ObjCRuntime;

[assembly: LinkWith ("libpjsua2.a", SmartLink = true, ForceLoad = true)]
