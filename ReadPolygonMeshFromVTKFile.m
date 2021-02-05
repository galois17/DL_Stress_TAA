function Mesh = ReadPolygonMeshFromVTKFile(FilePathAndName)
Mesh = ReadMeshFromVTKFile(FilePathAndName);
Mesh.Face=Mesh.Element;
Mesh=rmfield(Mesh, 'Element');
