// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Importamos los contratos de OpenZeppelin que vamos a necesitar.
// ERC721: El estándar para NFTs.
// ERC721URIStorage: Una extensión para guardar la URL de los metadatos de cada NFT.
// Ownable: Un sistema de control de acceso simple para que solo el dueño del contrato pueda acuñar nuevos NFTs.
// Counters: Para generar IDs de token autoincrementales de forma segura.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @title ARFilterLicense
 * @dev Este contrato crea licencias de uso para filtros de Realidad Aumentada como NFTs.
 * Cada NFT es único y representa una licencia para un filtro específico.
 * El dueño del contrato es el único que puede crear (acuñar) nuevas licencias.
 */
contract ARFilterLicense is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    /**
     * @dev El constructor inicializa el contrato, dándole un nombre y un símbolo.
     * También transfiere la propiedad del contrato a la dirección que lo desplegó.
     */
    constructor() ERC721("ARFilterLicense", "ARFL") {
        // La dirección que despliega el contrato se convierte en el 'owner'.
    }

    /**
     * @dev Acuñar una nueva licencia de filtro AR y asignarla a un comprador.
     * @param buyer La dirección de la billetera del comprador que recibirá el NFT.
     * @param tokenURI Un enlace a un archivo JSON que contiene los metadatos del filtro.
     *
     * Requerimientos:
     * - Solo puede ser llamado por el dueño del contrato (`onlyOwner`).
     *
     * El `tokenURI` debe apuntar a un JSON con este formato:
     * {
     *   "name": "Filtro Boda Virtual 2025",
     *   "description": "Licencia de uso para el filtro de confeti personalizado.",
     *   "image": "https://tuservidor.com/preview_filtro.png",
     *   "external_url": "https://gumroad.com/l/link_al_filtro"
     * }
     */
    function createLicense(address buyer, string memory tokenURI)
        public
        onlyOwner // Modificador que asegura que solo el dueño pueda llamar a esta función.
        returns (uint256)
    {
        // Obtiene el ID para el nuevo token.
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        // Acuñamos el nuevo NFT y lo asignamos a la dirección del 'buyer'.
        _mint(buyer, newItemId);

        // Asignamos la URI de metadatos al nuevo NFT.
        _setTokenURI(newItemId, tokenURI);

        // Devolvemos el ID del token creado.
        return newItemId;
    }

    // Las siguientes dos funciones son requeridas por el estándar ERC721URIStorage.
    // Hacen que la funcionalidad de `tokenURI` y la de `burn` (quemar/destruir token) estén disponibles.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
